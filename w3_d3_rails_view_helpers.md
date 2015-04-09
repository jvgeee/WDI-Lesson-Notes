View helpers (ActiveSupport)
============

## Opening

We've seen that Rails already extends Ruby. One way it does this is by including a component called **Active Support** which offers us a lot more "helpful" functionality in the form of additional methods which we can access in additon to the Ruby basic ones. 

- [ActiveSupport](http://guides.rubyonrails.org/active_support_core_extensions.html)

<br>

## We Do: ActiveSupport in irb

Let's launch irb:

```
irb
"".blank?
=> undefined method `blank?' for "":String

require 'active_support/all'
=> true

nil.blank?
=> true

"".blank?
=> true
```

An object is blank if it's false, empty, or a whitespace string. For example these are all blank:

- ''
- ' '
- nil
- []
- {}

```
%w(eggs bacon pancakes mushrooms).to_sentence
```
- *Converts the array to a comma-separated sentence where the last element is joined by the connector word.*

<br>

## I Do: Action Controller & Action View

- [Link to docs](http://guides.rubyonrails.org/action_view_overview.html)

Web requests in Rails are handled by another component called **Action Pack**, which splits the work into two main parts:

1. **Action Controller**: which performs the logic.
2. **Action View**: which renders a template to HTML. 
  
(Typically, **Action Controller** will be concerned with communicating with the database and performing CRUD actions where necessary. **Action View** is then responsible for compiling the response).

<br>

## We Do: View helpers

Action View, contains helpful methods which we can use called **view helpers** which are generally designed to make our life easier. They simplify common tasks done in our view files when they are rendered to HTML. They:
  
  - **Generate HTML elements**
  - **Standardise display**

This is only a brief overview summary of the helpers available in Action View. It's recommended that you review the [API Documentation](http://api.rubyonrails.org/classes/ActionView/Helpers.html), which covers all of the helpers in more detail.
  
<br> 

## We Do: Use helpers in a rails app
[i]: Continues from the Routing Lesson.

Send over the starter code or setup new app in rails or provide zip (which has basic css):

```
$ rails _4.1.8_ new view_helpers
$ cd view_helpers
$ touch app/controllers/home_controller.rb
$ mkdir app/views/home
$ touch app/views/home/home.erb
```

Add this to the HomeController:

```
class HomeController < ApplicationController
  respond_to :html

  def home
  end

end
```
Add this to config/routes.rb:

```
Rails.application.routes.draw do
  root to: 'home#home'
end
```

### Url Helpers

In the view file, you can generate a link with a url helper:

```
<%= link_to "Go Home", root_path %>
<%= link_to 'google', 'http://google.co.uk', data: { confirm: 'Are you sure?' } %>
```
- `:confirm` - uses JS that we've not covered yet but we don't need to because Rails does it for us!
  
### FormTagHelper (and Form Helpers)

You can generate a forms and inputs with form helpers:

```
<%= form_tag('/home') do %>
  <%= text_field_tag 'input_id' %><br />
  <%= text_area_tag 'input_textarea' %><br />
  <%= submit_tag 'Save' %>
<% end %>
```

You can look at the output in the source using 'view source'.
Often with view helpers, you can add additional parameters:

```
<%= text_field_tag 'ip', '0.0.0.0', maxlength: 15, size: 20, class: "ip-input" %>
```

### Number Helpers

Sometimes you might want to format numbers in your views:

```
<%= number_to_currency(1234567890.50) %>
<%= number_to_human(1234) %>
<%= number_to_human(12345) %>                          
<%= number_to_human(1234567) %>
<%= number_to_human(1234567890) %>
<%= number_to_human(1234567890123) %>
<%= number_to_human(1234567890123456) %>
<%= number_to_human(1234567890123456789) %>
<%= number_to_human(489939, precision: 2) %>
<%= number_to_human_size(1234567890) %>
```

### Date Helpers

Distance of time in words is an alias of time_ago_in_words:

```      
<% from_time = Time.now %>
<%= distance_of_time_in_words(from_time, from_time + 50.minutes) %>
```  

### Text Helpers

Common things you want to do to text:

```
<%= pluralize(1, 'person') %>
<%= pluralize(2, 'person') %>
<%= pluralize(3, 'person', 'users') %>
```

- pluralize(count, singular, plural = nil).
    
```
<%= truncate("A long time ago, in a Galaxy far, far away.") %>
=> "A long time ago, in a Galax..."

<%= truncate("A long time ago, in a Galaxy far, far away.", separator: ' ') %> 
=> "A long time ago, in a..."
```
    
### Tag Helper

Returns an empty HTML tag which by default is XHTML compliant.

```
<%= tag("br") %>

<%= tag("div", :data => {:name => 'Stephen', :city_state => %w(Chicago IL)}) %>

<%= tag("input", :type => 'text', :disabled => true) %>
```
Note the options hash is not wrapped in hash-tags. You'll see this a lot in Rails:

```
<%= tag("input", {:type => 'text', :disabled => true}) %>
```

You can also do:

```
<%= content_tag(:div, "Hello world!") %>

<%= content_tag :div, :class => "strong" do %>
  Hello world!
<% end %>
```
Now have a look at the html using view source.

<br>



