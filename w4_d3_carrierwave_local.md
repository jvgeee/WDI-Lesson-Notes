File Uploads with Carrier Wave
=====

## Opening

Carrier Wave is a gem provides a simple and extremely flexible way to upload files to Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.

#### Documentation

Carrierwave makes a quite tricky job very easy and it has really great documentation.

- Github page [here](https://github.com/carrierwaveuploader/carrierwave)
- Wiki page available [here](https://github.com/carrierwaveuploader/carrierwave/wiki)

<br>

## We Do: Scaffold basic app

Let's make a new app that can store our favourite pieces of street art. 

```
rails new street_art_gallery --database=postgresql
cd street_art_gallery
rails g scaffold Location name
rake db:migrate
subl .
```

#### Add Root route

Implement a root route and delete the comments.

```
Rails.application.routes.draw do
  root "locations#index"
  resources :locations
end
```

#### Add Basic navigation

Let's add a basic navigation so we can look around the app:

```
 <header>
   <nav>
     <ul>
       <li><%= link_to "Locations", locations_path %></li>
       <li><%= link_to "Create Location", new_location_path %></li>
     </ul>
   </nav>
 </header>
```

#### Launch app

Launch the app with:

```
rails s
```

<br>

## We Do: Add the carrierwave gem

Next, we need to add the carrierwave gem into the Gemfile:

```
gem 'carrierwave', '0.10.0'
```

And install with:

```
bundle
```

#### Generate an uploader

In order for Rails to work with Carrierwave, the gem has installed a new generator. We can check that with:

```
rails g

Uploader:
  uploader
```

To use we do:

```
rails g uploader GraffitiImage
  create  app/uploaders/graffiti_image_uploader.rb
```

This last parameter is the name of the uploader that we want to create. It could be anything.

This will create a file for us at: 

```
app/uploaders/graffiti_image_uploader.rb
```

<br>

## We Do: Add migration for image

When you run your app, you will likely serve your assets from a cdn. A content delivery network or content distribution network (CDN) is a large distributed system of servers deployed in multiple data centers across the Internet. 

We will need some way of linking the image we upload to the space in our database. We will generate a migration for this. 

```
rails g migration AddGraffitiImageToLocations graffiti_image
```

This will create a migration which will add a LocationImage column to our Locations table.

Now migrate your database.

```
rake db:migrate
```

#### Strong Params

Then add recipe_image to recipe_params, in recipes controller so it looks like this:

```
def recipe_params
  params.require(:recipe).permit(:name, :graffiti_image)
end
```

<br>

## We Do: Mount uploader

Now we will mount the uploader to our recipe. In the recipe model add the uploaded definition and the accessible attribute:

```
class Location < ActiveRecord::Base
  mount_uploader :graffiti_image, GraffitiImageUploader
end
```

Here we are specifying the table column followed by the uploader class.

They don't have to be called the same thing.

<br>

## We Do: Amend the views

#### Add file input to form

Now if we go into view, and recipes form, we can add:

```
 <div class="field">
   <%= f.label :graffiti_image %><br />
   <%= f.file_field :graffiti_image %>
 </div>
```

#### Add image to location show page

Add to the location show page:

```
 <p>
   <b>Image:</b>
   <%= image_tag @location.graffiti_image.url %>
 </p>
```

#### Add image to location index page

```
 <% @locations.each do |location| %>
   <tr>
     <td><%= location.name %></td>
     <td><%= image_tag location.graffiti_image.url %></td>
     <td><%= link_to 'Show', location %></td>
     <td><%= link_to 'Edit', edit_location_path(location) %></td>
     <td><%= link_to 'Destroy', location, method: :delete, data: { confirm: 'Are you sure?' } %></td>
   </tr>
 <% end %>
```

We will now be able to upload your images through the new recipe form. These images will be stored at: 

```
public/uploads/location/graffiti_image/
```

Take a look at the public uploads folder.

The database will store the filename as a string.

<br>

## We Do: Style

Let's style the image. In locations.scss

```
img {
  width: 100px;
  height: 100px;
  border: 1px solid #6B1229;
}
```

But the image is squished?

<br>

## We Do: Install RMagick

In order to manipulate our images, we will need to use a gem called [RMagick](https://github.com/rmagick/rmagick). 

We will first need to install a tool called imagemagick. We do this with brew.

```
brew install imagemagick
````

Then, let's add the gem to our Gemfile.

````
gem 'rmagick'
```

And then bundle:

```
bundle
````

Note: If this breaks with an error finding 'MagickWand.h' then:

```
brew install pkg-config
``` 

And bundle again.

<br>

## We Do: Edit Uploader

Now we can go into our graffiti_image_uploader.rb and define some versions. 

First, we can first uncomment the line:

`include CarrierWave::RMagick`

Now we can manipulate images. Now uncomment the lines:

```
version :thumb do
  process :resize_to_fit => [50, 50]
end
```

And change it to: 

```
version :thumb do
  process :resize_to_fill => [100, 100]
end
```

Now add these lines below your thumb version:

```
version :detail do
  process :resize_to_fit => [400, 400]
end
```

## We Do: Remove CSS

We will now need to remove the css on our images, to allow RMagick to do the work for us. 

Remove the styling from your location.scss file.

#### Update to use thumb url

Now we can go back into our location/show view and update this line:

```
 <p>
   <b>Image:</b>
   <%= image_tag @location.graffiti_image.url %>
 </p>
```

To say:

```
 <p>
   <b>Image:</b>
   <%= link_to image_tag(@location.graffiti_image.thumb.url), @location.graffiti_image.url %>
 </p>
```

#### Re-upload the image

This will render the thumbnail, and link to the full version we specified in location_image_uploader.rb.

<br>

## We Do: Remote Image

If you want to add a remote image (from a website that uses HTTP) then all you need to do is to add `remote_graffiti_image_url` to location_params, in the locationsController, so that it looks like this:

```
def location_params
  params.require(:location).permit(:name, :graffiti_image, :remote_graffiti_image_url)
end
```

Then in the form view file, add:

```
 <div class="field">
   <%= f.label :remote_graffiti_image_url %><br />
  <%= f.text_field :remote_graffiti_image_url %>
 </div>
```

Now try uploading with the [url](http://www.standard.co.uk/incoming/article8670651.ece/alternates/w620/29mural2406.jpg).

Carrierwave will do the rest for you!

<br>
