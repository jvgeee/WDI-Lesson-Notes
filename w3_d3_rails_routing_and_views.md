
Routing and Views
=====

##Opening


In this lesson, we are going to talk about "routing".

It's focussed around the MVC pattern.

```

                                          -----> Model <----> DB
                                         |         |
            response        request      |         |
   Browser <-------- router -------> controller <-- 
                             GET         ^
                             PUT         |
                             POST         -----> view <----> html/images/css/js
                             DELETE
       
```

When a user makes a request to the browser, the web-application needs to know what content to show them.

Let's compare with code that we have previously written.

[i] This is from the recipes_controller.rb file from the cookbook homework.

In Sinatra we defined the routes within our controller action:

```
  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end 

  get '/recipes/new' do
    @recipe = Recipe.new
    @categories = Category.all
    erb :'recipes/new'
  end
```

A "route" is a combination of the path that was requested, and the HTTP verb that was used to request that path.


##We do : Link a route to a controller

```
  rails new routing_app
  cd routing_app
```

Rails has a "routing engine" that separates this from the controller. The configuration for the routing engine is held in the file `config/routes.rb`.


Let's create a controller.

```
  touch app/controllers/home_controller.rb
```


Add the method about_us in the controller home:

```
  class HomeController < ApplicationController
  
    ## This is a controller action called about_us
    def about_us
      render text: "hello from Rails! This is all about us..."
    end
    
  end
```

At the moment, this action can not be accessed via an http route, we need to add a route handler.


In `config/routes.rb` delete all the comments and replace with:

```
  get '/about_us', to: 'home#about_us'
```

* `get` is the http verb to use for this request
* `/about_us` is the `uri` to call to access this resource 
* ` to: 'home#about_us'` is a key defining which method and controller will be use dby 
Let's have a look at this then:

```
  rails s
```

And visit `http://localhost:3000/about_us` in the browser.

<br>


##We do: Let's add some more!    

Add some more:

```
  get '/faqs', to: 'home#faqs'
  get '/terms_and_conditions', to: 'home#terms'
```


## But now we need to add these actions to our controller...

```
  # controllers/home_controller.rb:

  def faqs
    render text: "Question, questions questions..."
  end

  def terms
    render text: "Terms..."
  end
```


## Views

Just like in Sinatra, we have a directory for views, and everything for the user goes in there.

```
  mkdir app/views/home
  
  touch app/views/home/about_us.html.erb
  # move the "render" text into here...
  
  touch app/views/home/faqs.html.erb
  touch app/views/home/terms.html.erb
```

## Layouts like Sinatra

In Sinatra we had to create the layout. But in Rails, we get a default there already - `app/views/layouts/application.html.erb`,

Add some navigation links to it:

```
  <nav>
    <ul>
      <li><a href='/about_us'>About Us</a></li>
      <li><a href='/faqs'>Faqs</a></li>
      <li><a href='/terms_and_conditions'>Terms & Conditions</a></li>
    </ul>
  </nav>
```

### Homepage

We call the "landing page" of our web app the "Root route", and we need to define it in the routes file.

```
  root to: 'home#about_us'

##I do: Rake Routes

We can see all of the routes defined in our application by running:

```
  rake routes
```

    

```
