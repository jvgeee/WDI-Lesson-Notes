
# jQuery
========
Pre - send over: `index_start.html`

### Isn't all of this JS syntax a bit tricky?

We've been writing all our own "vanilla" JS, but we've been discovering some limitations.

- Writing `document.getElementById('elementId')` is kind of a pain, isn't it? And so are the other "get element(s)" syntax of javascript.

#### Problems with IE

- What happens if we open our page in IE? 
  - `addEventListener` isn't supported in browsers older than IE8. 
  - Some older browsers insist on the last parameter of the addEventListener being supplied
  - Who knows what new browsers will do...

### These are two main reasons we use jQuery

- jQuery is a library that makes JavaScript nicer to work with. 
  - Smooths out cross-browser inconsistencies
  - Makes it much nicer to get access to DOM elements
  - Provides utilities for common tasks, like AJAX and some pretty stuff. 
  - jQuery code terser
  
## Let's start by comparing with js 
- Go through the javascript click events and compare with the jquery version.

```
Open click_events.html
```
- Much easier to read isnt it?

## jQuery basics
- The `$` is your friend. It's the jQuery Swiss Army Knife. 
- jQuery has defined a function called `$` which returns the jQuery object
- You'll use it to get elements to work with.
- And to get jQuery objects, which support more methods than regular DOM objects. 
  
### Naming jQuery objects with $ 
  - In Ruby, using a '$' implies global scope, and is generally considered to be 'bad' - frequently JS variables with are jQuery objects get named `$myVariableName` to indicate that they are jQuery objects (although the '$' character has no explicit special meaning in JS)
- You'll also use [http://api.jquery.com](http://api.jquery.com) a lot. A LOT. 

-----------

## Let's get started
- Open: `index_start.html`

Let's convert our example from the Unobtrusive Javascript Class to use some jQuery.


### First, include jQuery
[Get jQuery](www.jquery.com/download) and include it in your HTML.

```
 <script src="jquery-1.11.0.js"></script>
```
Or you can grab it from the Google CDN repository, (recommended).

```
 <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
```

## Document Selectors
- Go into the console.

When I pass the `$` an argument, it queries the DOM and retrieves the object that it finds.

### We use can use CSS selectors!!!

```
$('body')
``` 
- will return all the DOM elements that have the tag name 'body'

```
$('#helloButton')
``` 
- will return the DOM element that has the id `#helloButton`.

```
$('.list-item')
``` 
- will return the DOM elements that have the class `.list-item`.
```
$('ul > li');
```
- will return the ul > li, like CSS.

```
* $('li').each(function(i, el) { 
*    console.log($(el).text()); 
* });
```
- Will iterate every 'li' element, turn it into a jQuery object, and output the text value to the console.

### Specificity matters, like CSS
- for performance.
- for clarity.


#### Refactor: Change the Document selectors:

```
var helloButton = document.getElementById('helloButton');
```
We can change this to be:

```
var $helloButton = $('#helloButton');
```

## Traversing the DOM

jQuery gives us access to some really useful methods for 'traversing' the DOM.

```
$('ul');
```
Accessing the children of this element:

```
$('ul').children();
```
Accessing the parent of this element:
```
$('ul').parent();
```
You can chain theses methods:
```
$('ul').parent().children();
```
Selecting the first item:
```
$('ul').children().first();
```
Selecting the last item:
```
$('ul').children().last();
```

## Event handlers

jQuery gives us a cross-browser way of listening for the document to be ready before executing code called document ready: 

```
$(document).ready(function() {
    console.log( "ready!" );
});

// Or with the shorthand
$(function() {
    myApp.setup
});
```

You can also pass a named function to $( document ).ready() instead of passing an anonymous function.


#### Refactor: Change document ready:
```
document.addEventListener('DOMContentLoaded', myApp.setup);
```
To be:

```
$(document).ready(myApp.setup);
```

## jQuery "on"
The `.on()` method attaches event handlers to the currently selected set of elements in the jQuery object. As of jQuery 1.7, the `.on()` method provides all functionality required for attaching event handlers. For help in converting from older jQuery event methods, see `.bind()`,  `.delegate()`, and `.live()`. To remove events bound with `.on()`, see `.off()`. To attach an event that runs only once and then removes itself, see `.one()`.

#### Refactor: Change the event listeners:

```
helloButton.addEventListener('click', myApp.sayHello);
```
To be:

```
$helloButton.on('click', myApp.sayHello);
```

## Content modification
As we saw in the selectors, we can pluck objects out of the DOM and turn them into jQuery objects (to perform more jQuery functionality with them), and we can use jQuery to interrogate them:

Let's have a look in the console:

```
$('li')[0]
// Doesn't work
$('li')[0].text() 

$($('li')[0]).text() 
```

We can also use jQuery to manipulate them... to change their attributes, such as their value:

```
$($('li')[0]).text('new text')
```

#### Refactor: Change an attribute
```
body.className = body.className.replace(/nojs/, '');
```
To be:

``` 
var $body = $('body').first();
   $body.removeClass('nojs');
}
```

### jQuery Wizz-Bang Effects

Add a hidden message to the html:

```
 <p class="hidden message">you just clicked my button</p>
```

And add this to the head:

```
 <style>
  .hidden {
    display: none;
  }

  .message {
    background-color: #aaf;
    border: 1px solid blue;
    border-radius: 5px;
    padding: 10px;
    line-height: 2;
  }
 </style>
```

In the function that is called when the button is clicked, alter the code to no longer alert, but instead to use some jQuery animation.

```
myApp.sayHello = function () { 
   // alert('Hello WDI!'); 
   var $message = $('.message').first();
   $message.slideDown();
}
```

Animations can be chained too:

```
  $message.slideDown().delay(1000).slideUp();
```

To be extra dilligent, we might also want to remove the class of 'hidden'

```
  $message.slideDown().removeClass('hidden');
```

or to ensure the next operation waits for the first to finish:

```
  $message.slideDown(1000, function () { $(this).removeClass('hidden') }
```

or we could use `.slidetoggle()`
```
  $message.slideToggle(1000)
```

---------------------
### Optional:
## Event Delegation in jQuery

Event delegation can be a confusing topic for those who are unfamiliar with the concept. But, luckily, it's really simple. 

Imagine that you have five hundred anchor tags on your page. As you might imagine, adding a click event to every one of those would be time consuming, and unnecessary. 

On top of that, what happens if, once you click on those anchor tags, we add additional anchor elements to the page? Would those new anchors be bound to the click event as well? The answer is no. You would then have to reattach a listener to those newly created elements.

### Enter Event Delegation
Instead, with event delegation, we simply add a single event listener to an ancestor element, maybe something like a "ul." Then, when the user clicks on one of its child elements, like an anchor tag, we only check to see if the target of the click was, in fact, an anchor tag. If it was, we proceed per usual.

```
$('ul').on("click", "a", function(e) {
	alert('clicked');
});

```

### Advantages

- Only attach one event listener to the page, rather than five hundred (in our example)
- Dynamically created elements will still be bound to the event handler.


### Why Does this Work?

It works because of the way elements are captured (not IE) and bubble up. For instance, consider the following simple structure.

```
 <ul>
   <li><a href="#">Anchor</a></li>
 </ul>
```

When you click on the anchor tag, you're also clicking on the 'li' and the 'ul' and even the 'body' element. This is referred to as bubbling up.

(Remember Propagation?)

---------------------

### Your turn. Convert the rest of your 'calc it' apps to use unobtrusive JS --> and jQuery. 
