Intro to Sinatra
=====

##Opening

Sinatra is a light-weight Ruby web framework

- It handles serving pages for requests, but leaves pretty much everything else to us
- [The Sinatra docs](http://www.sinatrarb.com)


We can install it using a gem:

```
gem install sinatra sinatra-contrib
```

[i]: https://github.com/sinatra/sinatra-contrib # some common extensions to Sinatra we might find useful

<br>

##I Do: What is a web framework?

A web framework is a code library that makes a developer's life easier when building reliable, scalable and maintainable web applications.

Frameworks make it easier to reuse code for common HTTP operations and to structure projects so developers with knowledge of the framework can more quickly build and maintain the application.

Lazy programmers can't be bothered to reinvent the wheel!

<br>

##I Do: MVC Diagram

Let's have a quick look at a MVC diagram:

![image](mvc_diagram.png)

Sinatra basically lets you create an app quickly.

<br>

##We Do: My first Sinatra website

Let's first create a file:

```
$ mkdir sinatra_intro
$ touch main.rb
```

Then add this code:

```
# hi.rb
require 'sinatra'
```

Requiring sinatra will start a server for Sinatra::Application. This is called a classic Sinatra application.

#### Creating an action

You now have a sinatra app. However, we need to create an action.

```
get '/hi' do
  "Hello World!"
end
```

In order to create an action, we need to use:

- An HTTP verb, get, post, put, patch.
- A path as a string, '/hi'
- A code block, to run when these two are matched, e.g. GET request to /hi

Then run the app with:

```
ruby hi.rb
```

You will see this:

```
== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from Thin
Thin web server (v1.6.3 codename Protein Powder)
Maximum connections set to 1024
Listening on localhost:4567, CTRL+C to stop
```

Navigate to ```localhost:4567/hi``` in your browser.

<br>

##We Do: Sinatra reloader

When we launch the website, we're running the application "as is". If we change the application, then this change won't be seen in the browser. Let's have a look:

```
get '/hi' do
  "Hello"
end
```

We can add something called sinatra reloader to the top of our app:

```
require 'sinatra'
require 'sinatra/reloader' if development?
```

Then stop the server, with ```ctrl+C```. You will see:

```
^CStopping ...
Stopping ...
== Sinatra has ended his set (crowd applauds)
```

Then restart again with ```ruby main.rb```. And make a change and reload.

<br>

#### puts & print

If you use any `puts` or `print` calls, their output will appear on the terminal console, not in the browser.

```
get '/hi' do
  puts "hi"
  "Hello world"
end
```

<br> 

##We Do: Add a homepage

Let's create another action for the homepage

```
get '/' do
  'this is the homepage'
end
```

<br>

##We Do: Params in the path

Let's create a new action that accepts a parameter in it's path:

Route patterns may include named parameters, accessible via the params hash:

```
get '/friends/:name' do
  "This friend's name is: #{params[:name]}"
end
```

Now navigate to ```/friends/alex``` and ```/friends/ben```.
  
You can make this more complicated:

```
get '/friends/:first/:last/:age' do
  "your name is #{params[:first]} #{params[:last]} and you are #{params[:age]} years old"
end
```

Now navigate to ```/friends/alex/chin/27```.

<br>

##We Do: Erb

So far, Sinatra is handling out routes using some custom actions and just returning text to the browser. 

This is a bit boring if we want to do interesting things with out application.

Let's render a page:

Let's change:

```
get '/' do
  erb :home
end
```

#### What is erb?

Erb is Ruby's in-built templating language. It's basically html that let's you put some Ruby in it that gets execulted and compiled into HTML before it is sent back to the browser.

#### The views folder

Sinatra looks for you to put view files in a specific folder called views.

```
$ mkdir views
```

Let's create a new file:

```
$ touch views/home.erb
```

Inside the home file:

```
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <h1>This is the homepage.</h1>
</body>
</html>
```

#### Using an instance variable.

In order to render some content in the browser, we need to create an instance variable. We do this by using an ```@```

```
get '/' do
  @header = "Homepage"
  erb :home
end
```

We then use erb tags to print this out in the view:

```
 <h1><%= @header %></h1>
```

<br>

##We Do: Public folder

Let's add a stylesheet to Sinatra. The default place that Sinatra will look for files that you want to display in the browser is called public:

```
$ mkdir public
```

Create a stylesheet:
  
```
$ touch public/style.css
```

Add the stylesheet to the erb page:

```
<link rel='stylesheet' href='/style.css'>
```

Add some content to css:

```
body {
  background: red;
}
```
  
<br>

##We Do: REST

Notice the fact that we haven't really used REST in this app. This is basically because we don't have a 'resource' in this example. We could make it RESTful, but I don't think that's the point of this lesson.

<br>

##Closure

You can make Sinatra as complex as you want really. It's very customizable. 

<br>