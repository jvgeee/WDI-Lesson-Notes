Events in javascript
=====

##Opening: Javacript, Event Driven development

One of the features of the World Wide Web that makes it so popular is its interactive nature. When a Web page is rendered, the client can interact with it. clicking on links and buttons to change pages or to make windows pop up, entering information in forms and view responses based on entries. In these and many other ways, Web pages are responsive to actions. In other words, Web pages are "event-driven", reacting to events that initiated by the user such as mouse clicks or keyboard entries.


Event driven programming follows mainly a publish-subscribe pattern, ie a class (as an example) communicates with another class with events, not by calling methods directly.


Pretend you have two classes. Foo and Bar, with the following definitions:

```
// Foo is a class with a public method called lorem which prints our a message as an alert when called.
var Foo = function(){
    this.lorem = function()
    {
        alert("HELLO FOO");
    }
};

// Bar is a class that when instantiated creates an instance of Foo and calls lorem.
var Bar = function(){
    var foo = new Foo();
    foo.lorem();
};

```

Now if we wrote the pre using events, we would write something like this instead 

```
var Foo = function(){


    myEventSystem.on("lorem.event", lorem); // listen to the event and set a callback

    function lorem()
    {
        alert("HELLO FOO");
    }

}

// Bar is a class that when instantiated creates an instance of Foo and calls lorem.
var Bar = function(){
    var foo = new Foo();
    myEventSystem.send("lorem.event");
};
```

But we've also written **event-driven** programs, though we haven't called it that. 

- When our web server runs, it sets up our app and then just sits there. 
- It's not until something happens - an event - our visit to the web page - that our code runs. 

We can define events on elements, and what JS to run when the event happens. 

<br>

##I Do: Describe addEventListener

The addEventListener() method attaches an event handler to the specified element.

```
element.addEventListener(event, function, useCapture);
```

- The first parameter is the type of the event (like "click" or "mousedown").
- The second parameter is the function we want to call when the event occurs.
- The third parameter is a boolean value specifying whether to use event bubbling or event capturing. This parameter is optional.

<br>

##We Do: Implement some event driven code in javascript 

### Click events / Mouse events
Open the first file: `click_events.html`

Javascript allows us to capture and use click events.
Open the Javascript Console in Chrome. 

```
More Tools > Developer Tools > Javascript Console
```

You can bind an onclick event inline, like this:

```
<button onclick="alert('Hello WDI!');">I'm a button!</button>
```

Looking for onclick events is a very common event in web browsers:
Let's look at 4 kinds of onclick events:

- "click"

```
.addEventListener("click", function(e) {
  alert("I've been clicked!");
});
```

- "dblclick"

```
.addEventListener("dblclick", function(e) {
  alert("I've been clicked!");
});
```

- "mousedown"

```
.addEventListener("mousedown", function(e) {
  alert("I've been clicked!");
});
```

- "mouseup"

```
.addEventListener("mouseup", function(e) {
  alert("I've been clicked!");
});
```


### Hover events
Open the next file: `hover_events.html`

So is `onmouseover`, so we can use the event handler for that event:

```
<img src="http://fillmurray.com/200/301" onmouseover="this.setAttribute('src', 'http://fillmurray.com/200/300')" onmouseout="this.setAttribute('src', 'http://fillmurray.com/200/301')" width="200" />
```

In the context of the event, `this` means the element that the event is handled for (so the image tag in this example). And any document element can have events bound to it, and we can always use the console to see what's going on.

```
<body onlick="console.log(this)">
```

- "mouseover"

```
.addEventListener("mouseover", function(e) {
   console.log("mouseover!");
});

```

- "mouseout"
 
```
.addEventListener("mouseover", function(e) {
   console.log("mouseover!");
});
```

- "mousemove"

```
.addEventListener("mouseout", function(e) {
   console.log("mouseover!");
});
```

### Form events
Open the next file: `hover_events.html`

Like click events, forms are very common things to have to deal with on a website.

- "focus"

```
.addEventListener("focus", function(e) {
   console.log("focus!");
});
```

- "blur"

```
.addEventListener("blur", function(e) {
   console.log("blur!");
});
```

- "change"

```
var radios = document.getElementsByClassName("radio_event")

for( var i=0; i<radios.length; i++ ) {
  radios[i].addEventListener("change", function(e) {
          
    for( var a=0; a<radios.length; a++ ) {
      radios[a].checked=false;
      console.log(radios[a]);
    }

    this.checked=true;
    console.log('Radio selected');
  });
}
```

- "submit"

```
document.getElementById('form_event').addEventListener("submit", function(e) {
   alert("Form submitted");
   console.log("Form submitted");
   return false;
});
```


### Window events
Open the next file: `window_events.html`

As well as interacting with elements inside the page, like clicking items or interacting with forms. You can also access information when you change the browser window.

- Window "resize" event

```
window.onresize
```

- Window "scroll" event

```
window.onscroll

```


## I do: Event Bubbling - Lowest to highest
Open the next file: `bubbling_events.html`

The concept of **event bubbling** was introduced to deal with situations where a single event, such as a mouse click, may be handled by two or more event handlers defined at different levels of the **Document Object Model (DOM)** hierarchy. If this is the case, the event bubbling process starts by executing the event handler defined for individual elements at the **lowest level** (e.g. individual hyperlinks, buttons, table cells etc.). From there, the event bubbles up to the containing elements (e.g. a table or a form with its own event handler), then up to even higher-level elements (e.g. the BODY element of the page). Finally, the event ends up being handled at the highest level in the DOM hierarchy, the document element itself (provided that your document has its own event handler).

### Event Capturing - Lowest to highest
Event capturing is the opposite of bubbling (events are handled at higher levels first, then sink down to individual elements at lower levels). Event capturing is supported in fewer browsers and rarely used; notably, Internet Explorer prior to version 9.0 does not support event capturing.

### Event Propagation

The term **event propagation** is often used as a synonym of event bubbling. However, strictly speaking, event propagation is a wider term: it includes not only **event bubbling** but also **event capturing**. 

```
.stopPropagation();
```



##Closure

<br>

###Deliverable

Example of finished code

<br>

###Questions

<br>



