
The Basics of JavaScript DOM Manipulation
=====

##Opening: What is the dom ?

The Document Object Model, or DOM, is an interface to allow programs and scripts to update content, structure, and style of documents dynamically. It is platform- and language-neutral. The DOM is not HTML nor is it JavaScript. It is something like the glue that binds them together.
DOM Level 0

The DOM level 0 is a mix of HTML functions that have not been formally specified that allow scripting languages to interact with the document. 


## I do: Use a dom object in javascript.

We can access any html tag in the document using javascript and the `document` object :

```

element = document.getElementById("any_id_of_any_element")
```

Then it' possible to change this javascript object properties, and this will be reflected in the HTML:

```
element.innerHTML = "I've been added via a DOM manipulation";
element.style.backgroundColor = "red";
element.style.border = "2px green solid";

```

<br>

## We do: Create a Dom object 

In an HTML document creates the specified HTML element or `HTMLUnknownElement` if the element is not known.

    var element = document.createElement(tagName);

* `element` is the created element object.
* `tagName` is a string that specifies the type of element to be created. The nodeName of the created element is initialized with the value of `tagName`. Don't use qualified names (like "`html:a`") with this method.


Adds a node to the end of the list of children of a specified parent node. If the node already exists it is removed from current parent node, then added to new parent node.

    var child = parent.appendChild(child);

* `parent` is the parent element.
* `child` is the node to append underneath `element`. Also returned.

<br>

##We Do: Different ways of accessing DOM elements

###Accessing by ID

Returns a reference to the element by its ID.

    element = document.getElementById(id);

###Accessing by Class Names

Returns an array of all child elements which have all of the given class names. This is not supported from IE8 and below, so be careful when using it.

    elements = document.getElementsByClassName(names); // or:
    elements = rootElement.getElementsByClassName(names);

* `elements` is a `HTMLCollection` of found elements.
* `names` is a string representing the list of class names to match; class names are separated by whitespace
* `getElementsByClassName` can be called on any element, not only on the document. The element on which it is called will be used as the root of the search.

### Accessing by Tag Name

Returns an HTMLCollection of elements with the given tag name. The complete document is searched, including the root node.

    var elements = document.getElementsByTagName(name);

* elements is a live HTMLCollection (but see the note below) of found elements in the order they appear in the tree.
* name is a string representing the name of the elements. The special string "*" represents all elements.

### Accessing First Found Selector

Returns the first element within the document (using depth-first pre-order traversal of the document's nodes) that matches the specified group of selectors. Supported by IE8 and up.

    element = document.querySelector(selectors);

* `element` is an element object.
* `selectors` is a string containing one or more CSS selectors separated by commas.

In this example, the first element in the document with the class "myclass" is returned:

    var el = document.querySelector(".myclass");

### Accessing an Array of Selectors

Returns a list of the elements within the document (using depth-first pre-order traversal of the document's nodes) that match the specified group of selectors. The object returned is a NodeList. Supported by IE8 and up.

    elementList = document.querySelectorAll(selectors);

* `elementList` is a non-live NodeList of element objects.
* `selectors` is a string containing one or more CSS selectors separated by commas.

This example returns a list of all div elements within the document with a class of either "note" or "alert":

    var matches = document.querySelectorAll("div.note, div.alert");


### Children of a Given Element.

`childNodes` returns a collection of child nodes of the given element.

    var ndList = elementNodeReference.childNodes;

### Next Sibling of a Given Element.

Returns the node immediately following the specified one in its parent's childNodes list, or null if the specified node is the last node in that list.

    nextNode = node.nextSibling

### Child Elements of a Given Object.

The `ParentNode.children` read-only property returns a live `HTMLCollection` of child elements of the given object. The items in the returned collection are objects and not strings. To get data from those node objects, you must use their properties (e.g. `elementNodeReference.children[1].nodeName` to get the name, etc.).

    var elList = elementNodeReference.children;

### Element Immediately Following Specified Element.

The `ChildNode.nextElementSibling` read-only property returns the element immediately following the specified one in its parent's children list, or null if the specified element is the last one in the list.

    var nextNode = elementNodeReference.nextElementSibling;





##We do: Setting and getting elements attributes and content


###Styling an HTML Element.

The `HTMLElement.style` property is an object that represents the element's style attribute. To get the values of all CSS properties for an element you should use `window.getComputedStyle()` instead.

    element.style.color = "#ff3300";
    element.style.marginTop = "30px";
    element.style.paddingBottom = "30px";

###Getting and Setting the HTML Elements.

`innerHTML` sets or gets the HTML syntax describing the element's descendants.

    // get the HTML of "element"
    var content = element.innerHTML;

    // set the HTML of "otherElement"
    otherElement.innterHTML = content;

###Getting and Setting the Class Name.

`className` gets and sets the value of the class attribute of the specified element.

    // get the class name of "element"
    var cName = element.className;

    // set the class name of "otherElement"
    otherElement.className = cName;

###Getting and Setting the ID.

Gets or sets the element's identifier (attribute id).

    // get the id of "element"
    var idStr = element.id;

    // set the id of "otherElement"
    otherElement.id = idStr;



<br>

## I do: Explain SetTimer and setTimeout



### setTimeout

The Browser provides a built-in scheduler which allows to setup function calls for execution after given period of time.

The syntax is:  
`var timerId = setTimeout(function(){}, delay)`


The execution will occur after the given delay.

For example, the code below calls `alert('hi')` after one second:

```
function f(){
    alert("hi")
}

setTimeout(f, 1000)

```

The code below use an anonymous function that will produce the same   

```

setTimeout(function(){ alert("hi") }, 1000)

```

### Cancelling the execution

The returned `timerId` can be used to cancel the action.

The syntax is: `clearTimeout(timerId)`.

In the example below the timeout is set and then cleared, so nothing happens.


```
var timerId = setTimeout( function() { alert(1) }, 1000)
clearTimeout(timerId)

```
### setInterval

The `setInterval(func|code, delay)` method has same features as `setTimeout`.

It schedules the repeating execution after every `delay` microseconds, which can be stopped by `clearInterval` call.


```
function f(){
    alert("hi")
}

var customInterval = setInterval(f, 1000)

```

This code will alert "hi" every second, if we want to stop it , we need to call `clearInterval(customInterval)`



## Deliverable
```
<html>
<head>
<title>Javascript animation: Demo 1</title>
<style type="text/css">

body {
 font:76% normal verdana,arial,tahoma;
}

h1, h2 {
 font-size:1em;
}

#fooObject {
 /* simple box */
 position:absolute;
 left:0px;
 top:8em;
 width:5em;
 line-height:3em;
 background:#99ccff;
 border:1px solid #003366;
 white-space:nowrap;
 padding:0.5em;
}

</style>
<script type="text/javascript">

var foo = null; // object

function doMove() {
  foo.style.left = parseInt(foo.style.left)+1+'px';
  setTimeout(doMove,20); // call doMove in 20msec
}

function init() {
  foo = document.getElementById('fooObject'); // get the "foo" object
  foo.style.left = '0px'; // set its initial position to 0px
  doMove(); // start animating
}


window.onload = init;

</script>
</head>

<body>

<h1>Javascript animation: Demo 1</h1>
<h2>Recursive setTimeout-based animation</h2>

<div id="fooObject">
 I am foo.
</div>

</body>
</html>
```

<br>



###Questions

<br>


###Closure

<br>