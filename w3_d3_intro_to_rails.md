Intro to Rails
=====

##Opening: What is Rails

  
Rails is the web application framework we've been building up to over the last two weeks.

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


- in Sinatra we had (effectively) one "controller" - Rails lets us have many
       
[http://guides.rubyonrails.org/](http://guides.rubyonrails.org/)



<br>
##We Do: Installation

Let's install Rails:

```
  gem install rails -v=4.2.1
```

Versions of Rails change quite rapidly, if you leave off the "-v", you'll get the latest version - so be specific if you want a specific version.

Rails includes some command-line tools, so if you're using `rbenv` you'll need to rehash.

```
  rbenv rehash
```


<br>
##I Do: The specs for our first app


Let's build a sample application that's supposed to do three things:

* Display a list of all recipes.
* Create new recipes and edit existing recipes.
* Assign a recipe to a category (like "dessert" or "soup").


#### Required features

- Title - Same on all pages.
- Heading - Same on all pages.
- Table
  - Recipe - Clicking on the link takes us to a page showing a non-editable view of the recipe. The page has links to edit and save the recipe and to return to the listing page.
  - (delete) - Clicking on the link deletes the recipe from the database and from the page.
  - Category - Clicking on the link causes the page to be refreshed with only recipes in that category included.
  - Date - The date should be assigned by the system when a recipe is created or edited.
- Footer - Appears on all pages. NOTE: On the Category pages, the link on the left will be "Create new category." It should behave similarly to the "Create new recipe" link. The rest of the footer is the same on all pages.
  - Create new recipe - Clicking on the link takes us to a form to enter the recipe's name, description, and instructions, and to select a category to which to assign the recipe.
  - Show all recipes - Clicking on the link displays all recipes. This is used to restore the display after the list has been filtered by clicking on one of the Category links.
  - Show all categories - Clicking on the link takes us to a list view for categories with links on the page to edit and delete existing Category entries. (Footer has the "Create new category" link.)

That's all we have to go on.

<br>


## We do: Let's create an app !



The Rails folder structure is (mostly) as follows:


```
  
  rails new cookbook
  cd cookbook
  
```

Now let's have a look at the structure, if we `cd` inside the app, at the top level, we have :

```

.
├── Gemfile
├── Gemfile.lock
├── README.rdoc
├── Rakefile
├── app
├── bin
├── config
├── config.ru
├── db
├── lib
├── log
├── public
├── test
├── tmp
└── vendor

```



* **app** : This organizes your application components. It's got subdirectories that hold the view (views and helpers), controller (controllers), and the backend business logic (models).



* **bin** : Introduced in Rails 4, the ./bin directory contains your app's "binstubs." Binstubs are wrappers around gem executables, like rails or bundle, which ensures a gem executable is run inside the correct environment for your Rails app.

* **config** : This directory contains the small amount of configuration code that your application will need, including your database configuration (in database.yml), your Rails environment structure (environment.rb), and routing of incoming web requests (routes.rb). You can also tailor the behavior of the three Rails environments for test, development, and deployment with files found in the environments directory.
 
* **db** : Usually, your Rails application will have model objects that access relational database tables. You can manage the relational database with scripts you create and place in this directory.



* **lib** :  You'll put libraries here, unless they explicitly belong elsewhere (such as vendor libraries).



* **log** : Error logs go here. Rails creates scripts that help you manage various error logs. You'll find separate logs for the server (server.log) and each Rails environment (development.log, test.log, and production.log).

* **public** : Like the public directory for a web server, this directory has web files that don't change, such a s JavaScript files (public/javascripts), graphics (public/images), stylesheets (public/stylesheets), and HTML files (public).

* **test** : The tests you write and those Rails creates for you all go here. You'll see a subdirectory for mocks (mocks), unit tests (unit), fixtures (fixtures), and functional tests (functional).



* **tmp** : Rails uses this directory to hold temporary files for intermediate processing.



* **vendor** : Libraries provided by third-party vendors (such as security libraries or database utilities beyond the basic Rails distribution) go here. 



* **config.ru** : Rack use configuration file with extension .ru, that instructs Rack::Builder what middleware should it use and in which order. 



* **Gemfile** : The Gemfile is where you specify which gems you want to use, and lets you specify which versions.



* **Gemfile.lock** : The Gemfile.lock file is where Bundler records the exact versions that were installed. This way, when the same library/project is loaded on another machine, running bundle install will look at the Gemfile.lock and install the exact same versions, rather than just using the Gemfile and installing the most recent versions. (Running different versions on different machines could lead to broken tests, etc.) You shouldn't ever have to directly edit the lock file.

* **README.rdoc** : This file contains a basic detail about Rail Application and description of the directory structure explained above.

* **Rakefile** : This file is similar to Unix Makefile which helps with building, packaging and testing the Rails code. This will be used by rake utility supplied along with Ruby installation.

* **.gitignore** : .gitignore tells git which files (or patterns) it should ignore. It's usually used to avoid committing transient files from your working directory that aren't useful to other collaborators, such as compilation products, temporary files IDEs create, etc. `tmp` and `log` will be ignored by default.


##We Do: Use Generators


```

  rails generate scaffold Category 
  rails generate scaffold Recipe title:string instructions:text published_on:date

```

With "convention over configuration" in mind, we can use a lot of generators to produce common boilerplate code.

Typing `rails g` (or `rails generate`) will list the generators we have at our disposal:

```
  rails g controller
  rails g model
  rails g migration
  rails g scaffold
```

`rails g model` can also take arguments for fields types, and will create a migration too.

The same goes for `rails g controller`: 

```
  rails g controller NAME [action action] [options]
```



##We Do: Use Rake



```

  rake db:migrate
  rails server
```

(http://rake.rubyforge.org/)[http://rake.rubyforge.org/]

Rake is a task manager for Ruby.

Rake is useful for running tasks that change our application's behavior or are part of the application ("personal rake tasks"). We can see all the rake tasks by typing `rake -T`

Common Rake commands:

```
  rake routes
  rake db:create
  rake db:migrate
  rake db:rollback
  rake notes
  rake assets:precompile
```


##We do : Launch the server !

In your browser you can visit `http://localhost:3000/categories` and `http://localhost:3000/recipes`

That much functionality was a week's work once upon a time... it's now quicker (almost) than labelling columns in Excel...


##We do: Use Rails Console

We can use the Rails console to interrogate our objects and their attributes, etc.

```
  rails c

  Category.all

  Recipe.all
```


Not unlike "psql", "irb" or "pry", there is a console in rails. We access it by typing:

```
  rails console
```

or 

```
  rails c
```

And we can leave rails console by typing: 

```
  exit
```

Usually, we get into the console to manipulate models, check routes and debug the app.

We can use "pry-rails" to have the rails console with pry automatically interpreted. In order to do this, just add "pry-rails" to Gemfile in group development.

Let's look at some of this functionality and play with models in our rails console:

```
  recipe = Recipe.new 
  recipe.title = "Scrambled eggs" 
  recipe.instructions = "blablablablablablablbalbalbla"
```



```
  Recipe
  Recipe.count
  Recipe.all
  Recipe.all.class
  Recipe.where(id: 1) # make sure the id exists!
  Recipe.find(1)
```

Note the difference that "where" returns an array, while "find" returns a single object - recall the clunkyness of having to do this manually in Sinatra

```
  Recipe.where(title: "Curry")
  Recipe.order(:title)
  Recipe.order('title DESC')
```


#### Create and retrieve

```
  recipe = Recipe.new
  recipe.title = "Curry"
  recipe.description = "bla bla bla"
  recipe.save
  Recipe.last

  recipe = Recipe.new(title: "something")
  recipe.save
```


```
  recipe = Recipe.create(title: "Mint Lamb")
  Recipe.last

  recipe = Recipe.find_by_title("Mint Lamb") # old syntax - not preferred
  recipe = Recipe.find_by title: "Mint Lamb" # new syntax - preferred in Rails 4.x

  recipe.update(title: "Mint Lamb", description: "Most British meal ever") 
  recipe = Recipe.find_by title: "Mint Lamb"

  recipe.destroy
```

There is a ".delete", but stick to '.destroy' as it does more that just fire a DB query






##We do: Add associations

To link our Recipe model and Category model together, we need to add a foreign key to the recipes table. We would have previously done this with a SQL query, but Rails gives us "migrations" to manage our database.

```
  rails g migration AddCategoryIdToRecipes category_id:integer

  rake db:migrate

  # recipe.rb
  belongs_to :category

  # category.rb
  has_many :recipes 
```

We can play with this in the console.


[i]: ensure you have created at least two recipes, and one has no category... this will break the view later


### Update form with association
 
```
  # app/views/recipes/_form.html.erb
  <div class="field">
    <%= f.label :category_id, 'Category' %><br />
    <%#= f.number_field :category_id %><%# we are updating the category_id attribute, but rather than typing the ID in, it would be nice to have a drop-down of the names of the categories %>
    <%= f.select(:category_id, Category.all.map {|c| [c.name, c.id] }) %>
  </div>
```

But if we submit this, it doesn't save - Rails is protecting us from users altering forms and submitting unpermitted parameters by filtering for only those on the "whitelist".

We need to change the permitted parameters to include our new "category_id" field. This is in the "recipe_params" method in our controller:

```
  # app/controllers/recipes_controller.rb
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :published_on, :category_id)
  end
```

### Update views with association

```
  # app/views/recipes/show.html.erb
  <p>
    <b>Category:</b>
    <%= @recipe.category.name %>
  </p>
```

nice!


### Update views with association

```
  # app/views/recipes/index.html.erb
  <th>Category name</th>

  <td><%= recipe.category.name %></td>
```

oh noes... it broke... who gives up?...

Look at the error... fathom it... glean information...


...then change it to:

  `<%= recipe.category.name rescue nil %>`

blurgh... code smells.

change it again to:
  
  `<%= recipe.category.name if @recipe.category %>`

better.

but change again to:

  `<%= recipe.category.try(:name) %>`


### pretty it up a little

```
  # assets/stylesheets/application.css
  table {
    border-collapse:collapse;
    border:1px solid black;
  }

  table td {
    border:1px solid black;
  }
```


### Templating. Add footers, etc.

```
  # app/views/layouts/application.html.erb
  <!DOCTYPE html>
  <html>
  <head>
    <title>Online Cookbook</title>
    <%= stylesheet_link_tag    "application", :media => "all" %>
    <%= javascript_include_tag "application" %>
    <%= csrf_meta_tags %>
  </head>
  <body>
    <h1>Online Cookbook</h1>
    <%= yield %>

    <p>
      <% if controller_name == 'recipes' %>
         <%= link_to "Create new recipe", new_recipe_path %>
       <% else %>
         <%= link_to "Create new category", new_category_path %>
       <% end %>
     
       <%= link_to "Show all recipes", recipes_path %>
       <%= link_to "Show all categories", categories_path %>
     </p>

  </body>
  </html>
```

### Filtering in controller

```
  #recipes_controller.rb#index
  @recipes = case
  when params[:category_id].nil?
    Recipe.all
  else
    Recipe.where(category_id: params.delete(:category_id))
  end
```


