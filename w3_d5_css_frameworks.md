CSS Frameworks with Rails
=====

## Opening

#### What is a CSS Framework?

Styling our web applications can take time. Often we spend time doing the same HTML and CSS for every application that we make. 

CSS frameworks make our lives much easier by giving us CSS code and html templates that we can use 'off the shelf'. 

These are NOT the same as custom templates that you buy - those are often badly made. These CSS frameworks give you tools by which you can build up your apps.

There are lots of them, however the most popular are:

- [Bootstrap](http://getbootstrap.com/)
- [Foundation](http://foundation.zurb.com/)
- [Pure](http://purecss.io/)
- [Skeleton](http://getskeleton.com/)
- [Bourbon](http://bourbon.io/) 
- [Grid](http://960.gs/)

<br>

## We Do: Generate a simple rails app

Let's generate a simple rails app to style:

```
rails new css_frameworks_intro
cd css_frameworks_intro
```

Let's scaffold a resource to style:

```
rails g scaffold Posts title author content:text
rake db:migrate
```

<br>

## We Do: Intro to Foundation

[Foundation](http://foundation.zurb.com/) is one of the better frameworks on the market. Let's have a look at how it works.

#### Installing CSS frameworks

There are more complex tools out there on the market that help you to manage your front-end depencies however, as Rail's default 'package managment' is including gems, let's install the foundation gem.

#### Clean app/assets/stylesheets

Let's delete:

```
app/assets/stylesheets/posts.css
app/assets/stylesheets/scaffolds.css
```

#### Install using the gem

The github page for the gem, is [here](https://github.com/zurb/foundation-rails). It has additional information on it.

In the Gemfile, add:

```
gem 'foundation-rails'
```

[i]: Bug with release 5.4.3.1 and rails 4.2.1 for those who had it installed

And then after doing this, we need to:

```
$ bundle
```

#### Foundation generator

We can see that the installation of this gem has given us a new generator. To list the generators in rails we can use the commmand:

```
rails g
```

Let's run this generator with:

```
rails g foundation:install
```

We should get a **CONFLICT**. This conflict is going to overwrite our application.html.erb file.

Press:

```
y
```

Run the rails server with `rails s` and open `localhost:3000`.

#### Has the font changed?

Looks like the font has changed slightly...

<br>

## We Do: Adding a navbar

Go to the [Foundation Documentation](http://foundation.zurb.com/docs/) and scroll down to:

- Navigation
  - Top Bar
  
Copy the html code:

```
<nav class="top-bar" data-topbar role="navigation">
  <ul class="title-area">
    <li class="name">
      <h1><a href="#">My Site</a></h1>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
  </ul>

  <section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#">Right Button Active</a></li>
      <li class="has-dropdown">
        <a href="#">Right Button Dropdown</a>
        <ul class="dropdown">
          <li><a href="#">First link in dropdown</a></li>
          <li class="active"><a href="#">Active link in dropdown</a></li>
        </ul>
      </li>
    </ul>

    <!-- Left Nav Section -->
    <ul class="left">
      <li><a href="#">Left Nav Button</a></li>
    </ul>
  </section>
</nav>
```

And paste into `application.html.erb` underneath `body`.

And reload! How amazing is that!

<br>

## We Do: Grid System

One of the key features of CSS frameworks is the grid system. 

#### What is a grid system?

Websites are often structured very similar to newspapers, they are built from columns. Here are some examples of the foundation grid:

- [Example 1](http://foundation.zurb.com/grid-1.html)
- [Example 2](http://foundation.zurb.com/grid-2.html)

The foundation grid is a 12-column flexible grid that can scale out to an arbitrary size. 

### Devices

Grid systems also have to cater for different device sizes. The CSS to cater for this and make responsive websites that change column layouts are often dictated by screen sizes.

#### .row

The basic grid starts with a class of row. Add a class of "row" to main.

```
<main class="row">
  <%= yield %>
</main>
```

#### .columns

You can create a column layout by adding classes of `.column` or `.column` inside an element with a class of `.row`. 

The grid column layout is made up of two parts

- large, medium, small (the screen size which the grid is designed for)
- the number that you want to fit in that row, e.g. (4x3)

In application.html.erb:

```
 <!-- Wraps first -->
 <div class="row">
   <div class="large-4 columns">Column 1</div>
   <div class="large-4 columns">Column 2</div>
   <div class="large-4 columns">Column 3</div>
 </div>

 <!-- Wraps on medium screens -->
 <div class="row">
   <div class="medium-4 columns">Column 1</div>
   <div class="medium-4 columns">Column 2</div>
   <div class="medium-4 columns">Column 3</div>
 </div>

 <!-- Doesn't wrap on small screens -->
 <div class="row">
   <div class="small-4 columns">Column 1</div>
   <div class="small-4 columns">Column 2</div>
   <div class="small-4 columns">Column 3</div>
 </div>
```

Resize the page to see the difference.

As foundation is responsive, code for small screens first, and larger devices will inherit those styles. Customize for larger screens as necessary.

Comment out the rows...

#### Add a div with class .row to the top-bar

Let's add a header around the top-bar and add '.row' class to top-bar:

```
<header>
  <nav class="top-bar row" data-topbar role="navigation">
  ...
</header>
```

Then style in application css:

```
header {
  background: #333333;
}
```

<br>

## Assess: Add the Slider

Using the Foundation documentation, add a with some images slider.

<br>

## Closure

As you can see, CSS frameworks make our lives much easier! They are great tools for rapid prototyping however, in order to make web applications really customize and CSS that is really efficient you still need to be able to write custom CSS.

<br>
