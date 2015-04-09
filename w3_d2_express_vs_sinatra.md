Sinatra vs Express
=====

## Opening

Today we're going to compare the Ruby framework [Sinatra](http://www.sinatrarb.com/) to a Node framework called [Express](http://expressjs.com/).

Node is very "cool" at the moment as it is allowing us to do some really exciting things. However, you shouldn't be scared of it.

<br>

## I Do: Express is a Node framework

Let's do a quick recap:

#### What is Node?

Node is a low-level, non-blocking, event-driven platform which allows you to write JavaScript on the server-side. If you don't understand the low-level, non-blocking, event-driven bit... that's okay for the moment.

#### What is npm?

npm is Node's package manager. It's used to manage dependencies. Think of it a bit like RubyGems.

#### What is Express?

>  <cite>Express is a fast, unopinionated, minimalist web framework for Node.js.</cite>

Express.js is a simple web framework for Node.js. It provides many features for you to start using straight away (Routing, Sessions) that you would have to do yourself if using vanilla Node. 

Think of it like **Sinatra for Node**.

<br>

## I Do: Let's look at a Sinatra website

Have a look at the sinatra website that I've built. 

[i]: Send over the Sinatra Code

Let's have a look at the code working:

```
$ ruby app.rb
```
  
Navigate to ```localhost:4567```.

Now, let's have a look at app.rb:

```
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end
```

We require the sinatra framework using ```require 'sinatra'```. This allows us to use some of the methods and features in the sinatra framework.

We have also created one route action and told our app to render an index.erb file when someone makes a request to this action.

#### Sinatra views

This index.erb file is found in a **views** directory. This is the default setup of sinatra.

#### Sinatra public

The css file is loaded from a **public** directory. Again, another default of sinatra.

<br>

## We Do: Make an Express site

Now, let's compare Sinatra with express. Let's create a directory:

```
mkdir express && express
```
  
Let's create a new package.json file using:

```
npm init 
```

**NOTE**: For the first option, choose 

```
name: intro_to_express
```

Then hit enter to accept the defaults for the res and see the new [package.json](https://docs.npmjs.com/cli/init) file.

#### Aside

We can create an empty package json file by using:

```
echo '{}' > package.json
```

<br> 

## I Do: What is package.json?

All npm packages contain a file, usually in the project root, called package.json. 

This file holds various **metadata** relevant to the project. This file is used to give information to npm that allows it to identify the project as well as handle the project's dependencies. 

It can also contain other metadata such as:

- a project description
- the version of the project in a particular distribution
- license information
- even configuration data

All of which can be vital to both npm and to the end users of the package. The package.json file is normally located at the root directory of a Node.js project.

<br>

## We Do: Install Express

Next, we need to install express:

```
npm install express --save
```
  
`--save` will mean it gets added to the project dependencies (package.json file), this is similar to a gem but you can see it!

```
touch app.js 
```
  
You can call this file anything, often it's index.js. Let's get started.

#### Package.json

Let's check out the package.json file:

```
"dependencies": {
  "express": "^4.11.1"
}
```

We are saying that this app needs the node package express to run.

#### app.js

Let's start by requiring express. Very similar to how we required sinatra.

```
var express = require('express');
```
  
You can load your own javascript files using the `require()` function by simply passing it a string containing the relative path to a .js file you want to load.

#### no file extension

However, as we're requiring without a file extension and a full path we are talking about a node_module. We are requiring the express framework.

#### New instance of express app

Next, we want to call the express function to setup a new instance of an express app.

```
var app     = express();
```
  
We want to start the server on a specific port number:

```
var port    = process.env.PORT || 3000;
```

#### create action

Now we want to create a route. Remember a `route` is a combination of a url pattern + HTTP Verb (get, post, delete, update).

```
app.get('/', function(req, res) {
  res.send('Hello World');
});
```

** Notice the get verb here, this can also be post, put, delete etc... **

The function takes two arguments. ```req```, request and ```res``` response. 

Let's then make the app listen to things happening on this port.

```
app.listen(port);   
console.log('Server started on ' + port);
```

Then run the app using:

```
node app.js
```

Navigate to `http://localhost:3000` and voila! 

<br>

## We Do: Installing nodemon

Previously we would have to run a node file by typing `node nameOfFile.js`. This works well for command line app, but inside a web application, we want to make changes to our app and not have to reload every time. We will be using a utility called nodemon to help update those changes.

```
npm install -g nodemon
  
$ nodemon app.js
```

This is equivalent to ```sinatra/reloader```.

<br>

## We Do: Templating with EJS

We cannot keep using `res.send` to send a response. It would be much more efficient to store them in template files. 

Express is compatible with a couple of templating engines:

- [jade](http://jade-lang.com) similar to [HAML](http://haml.info).
- [EJS](http://www.embeddedjs.com/) which is similar to ERB.

EJS stands for Embedded JavaScript.

Instead of just sending some text when we hit our site let's have it serve an index page.

First thing to do is to install the EJS package.

#### Install EJS 

```
npm install ejs --save
```

You might want to `cmd+shift+p` and Install the EJS Sublime Package at this point

#### Set views dir and views engine

Now let's tell our app we want to use ejs and where we are going to put the templates. 

```
app.set('views', './views');
app.set('view engine', 'ejs');
```

We have used a syntax here ```app.set```. Here we are setting the options, ```views``` and ```view engine```. Express allows you to set a number of these [settings](http://expressjs.com/api.html#app.settings.table) parameters.  

#### Change app.js to render index

We also have to change what happens when a user GETs '/'. Let's get it to render our index template instead of sending 'Hello World'.

```
var express = require('express');
var app     = express();
var port    = process.env.PORT || 3000;

app.set('views', './views');
app.set('view engine', 'ejs');

app.get('/', function(req, res) {
  res.render('index');
});

app.listen(port);
console.log('Server started on ' + port);
```

** Notice ** that we have added:

```
res.render('index');
```

#### Create some views

Create a jade index page:

```
touch views/index.ejs
```

And add this code:

```
<!doctype html>
<html>
<head>
  <title>Express</title>
  <link type="text/css" rel="stylesheet" href="/css/style.css" />
</head>
<body>
  <header>
    <nav>
      <ul>
        <li>
          <img src="/images/nodejs-green.png">
        </li>
      </ul>
    </nav>
  </header>
  <h1>Hello world!</h1>
  <footer>&copy; Le Chinage and Le Gerage.</footer>
</body>
</html>
```

#### Add a public folder

Similar to the views folder, we need to explicitly set the public folder.

```
// Setup public folder, similar to sinatra (notice preceeding slash)
app.use(express.static(__dirname + '/public'));
```

#### app.use middleware

Here we have used a method .use which is an example of express' [middleware](http://expressjs.com/guide/using-middleware.html)... as is app.verb (app.get).

#### Add some styling

Inside the public folder, let's add a css file:

```
$ mkdir public/css
$ touch public/style.css
```

Add an images directory:

```
$ mkdir public/images
```

- Send across the css from [this gist](https://gist.github.com/alexpchin/1183175e7e0804696b00).
- And send across [this image](https://nodejs.org/images/logos/nodejs-green.png).

#### Let's take a look:

Finally serve the website with:

```
$ nodemon app.js
```

<br>

## Closure

We have compared two different types of Frameworks and setup very similar apps using them. We have also coded in two different languages.

However, we're still doing similar things!

We're setting up routes, we're requiring files. We're rendering templates.

<br>
