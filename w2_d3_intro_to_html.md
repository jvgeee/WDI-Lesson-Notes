Intro to HTML
=====

## Opening: What is HTML?

HTML stands for: 

- **H**yper **T**ext 
- **M**arkup 
- **L**anguage"

HTML is not a programming language, as it doesn't send any instruction to your computer. However, it does send instructions to the browser (Chrome, Firefox, Safari, etc.), telling it what to display on the screen. 

#### It's invention

The first version of HTML was written by **Tim Berners-Lee in 1993**. Since then, there have been many different versions of HTML. The most widely used version throughout the 2000's was HTML 4.01, which became an official standard in December 1999.

HTML was originally designed as a way to link academic documents together via hypertext references.

#### Markup Language

HTML is a **just text**, however the idea of a markup language is to define and present text in a way that allows sections to be formatted differently.

#### Progression of HTML

Have a look at this: [Evolution of the Web](http://www.evolutionoftheweb.com/).

Send across this gist.

|  Type of content |  HTML 1.2 |  HTML 4.01 |  HTML5 |  Purpose |
| ----- |----- |----- |----- |----- |
|  Heading |  Yes |  Yes |  Yes |  Organize page content by adding headings and subheadings to the top of each section of the page |
|  Paragraph |  Yes |  Yes |  Yes |  Identify paragraphs of text |
|  Address |  Yes |  Yes |  Yes |  Identify a block of text that contains contact information |
|  Anchor |  Yes |  Yes |  Yes |  Link to other web content |
|  List |  Yes |  Yes |  Yes |  Organize items into a list |
|  Image |  Yes |  Yes |  Yes |  Embed a photograph or drawing into a web page |
|  Table |  No |  Yes |  Yes |  Organize data into rows and columns |
|  Style |  No |  Yes |  Yes |  Add CSS to control how objects on a web page are presented |
|  Script |  No |  Yes |  Yes |  Add Javascript to make pages respond to user behaviors (more interactive) |
|  Audio |  No |  No |  Yes |  Add audio to a web page with a single tag |
|  Video |  No |  No |  Yes |  Add video to a web page with a single tag |
|  Canvas |  No |  No |  Yes |  Add an invisible drawing pad to a web page, on which you can add drawings (animations, games, and other interactive features) using Javascript |

<br>
## We Do: Make your first webpage

Let's make a new HTML file:

```
$ mkdir html  
$ cd html  
$ touch index.html  
$ subl index.html  
```
	
The first thing we need to do is to tell the program running this file that this contains html:

```
<!DOCTYPE html>
```

With HTML5, this is all you need to say. In HTML 4.01 Strict You had to put this:

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```

Let's get Sublime to do the job for us and type ```html``` then ```tab```.

You should get:

```
<html>
  <head>
    <title></title>
  </head>
  <body>

  </body>
</html>
```

Let's have a look at what we have added here:

```
<html>...</html>
```
	
Contains your html content - it will tell the browser that everything within these tags should be interpreted as HTML.

```
<body>...</body>
```

Contains the body of the page we will display.

<br> 

## I Do: The head tag

When opening a new html file, it is important to include a "head":

```
<head>
  <title>My first website</title>
  <meta name="description" content="This is a website...">
</head>
```

The "head" is important for search engines, as it helps provide additional information about the website. Anything within the <head> tags will NOT be displayed on the page. 

We had these tags right after the opening `<html>` tag, and before the opening `<body>` tag.

#### Meta content & keywords

It is important to mention that `<meta>` "content" and "keywords" are outdated HTML elements, and most recent webpages don't use them anymore.

<br>

### I Do: Semantic html

**Semantic HTML** is the use of HTML markup to reinforce the semantics, or **meaning**, of the information in webpages rather than merely to define its presentation or look. Semantic HTML is processed by regular web browsers as well as by many other user agents.

People often confuse the look of a webpage with semantics. However, WebBrowsers do care about semantic HTML.

<br>

## We Do: Common html elements

A list of common HTML elements can be found [here](https://developer.mozilla.org/en/docs/Web/HTML/Element).

#### header, footer, main

```
<header>Header</header>
```

The HTML **header** Element represents a group of introductory or navigational aids. It may contain some heading elements but also other elements like a logo, wrapped section's header, a search form, and so on.
]
	
```
<main></main>
```

Add a **main** tag. The HTML main element represents the main content of  the <body> of a document or application. This content should be unique to the document.

```
<footer>Footer</footer>
```

The HTML **footer** Element represents a footer for its nearest sectioning content or sectioning root element (nearest parent element). A footer typically contains information about the author of the section, copyright data or links to related documents.

#### h1,h2,h3,h4,h5,h6

Inside the body tag add:

```
 <h1>My first website</h1>
 <h2>Header2</h2>
 <h2>Header3</h2>
```

Heading elements implement six levels of document headings, **h1** is the most important and **h6** is the least. A heading element briefly describes the topic of the section it introduces. 

#### paragrah

```
 <p>Hello, here is some text.</p>
```
	
The HTML **p** element (or HTML Paragraph Element) represents a paragraph of text.

#### b vs strong

```
 <p><b>Important</b></p>
```
	
The HTML **b** Element represents a span of text stylistically different from normal text, without conveying any special importance or relevance. Best to avoid this one as it isn't too semantic, only stylistic.

```
 <p><strong>Attention!</strong></p>
```
	
The HTML Strong Element **strong** gives text strong importance, and is typically displayed in bold.

#### i vs em

```
 <p><i>Check this out...</i></p>
```
	
The HTML i Element represents a range of text that is set off from the normal text for some reason, for example, technical terms, foreign language phrases, or fictional character thoughts. It is typically displayed in italic type.

```
 <p><em>Emphasis</em></p>
```
	
The HTML em element (or HTML Emphasis Element) marks text that has stress emphasis.

#### ul & ol

```
 <ul>
   <li>Unordered item</li>
   <li>Unordered item</li>
 </ul>
```

The HTML unordered list element **ul** represents an unordered list of items, namely a collection of items that do not have a numerical ordering, and their order in the list is meaningless.

The HTML List item element **li** is used to represent a list item. It should be contained in an ordered list

```
 <ol>
   <li>Ordered item</li>
   <li>Ordered item</li>
 </ol>
```
	
The HTML **ol** Element (or HTML Ordered List Element) represents an ordered list of items. Typically, ordered-list items are displayed with a preceding numbering

#### img

```
<img src="http://fillmurray.com/300/300" alt="fill murray">
```
	
The HTML <img> Element (or HTML Image Element) represents an image of the document. This is a self-closing tag, so doesn't need a closing tag. It should include the source of the file (can be a url or a file path) and a description (alt) for the search engines. 

#### a

```
<a href="http://www.w3.org" target="_blank">
  <img src="http://www.misiide.net/images/2013/03/Tim-Berners-Lee.jpg" alt="A picture of Tim Berners-Lee!" />
</a>
```

The HTML **a** Element (or the HTML Anchor Element) defines a hyperlink, the named target destination for a hyperlink, or both.

You can add a `target="_blank` which will open the link into a new tab in the browser.

#### span & div

```
<span>HELLO............</span>
```

The HTML **span** element is a generic inline container for phrasing content, which does not inherently represent anything. It can be used to group elements for styling purposes. We can do this CSS.

Span is an inline-element and will only take the space they need on the page, as opposed to DIV elements.

```
 <div>GOODBYE........</div>
```

Block-element, these elements take up the whole width of the page, unless specific style is applied to them with CSS. They can contain paragraphs, headings, text, images, other divs, etc. They work as a way to structure the page with clearly delimited blocks. 

#### table

We use the `<table>` tags to display tabular data.

Example:

```
 <table border="1">
   <thead>
       <tr>
         <th>Date</th>
         <th>Weight</th>
         <th>Distance walked</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <td>September 15</td>
         <td>75 kg</td>
         <td>1.8 km</td>
       </tr>
       <tr>
         <td>September 29</td>
         <td>73 kg</td>
         <td>2.1 km</td>
       </tr>
     </tbody>
 </table>
```

In our browser, we get:

Date | Weight | Distance Walked
-----|--------|-----------------
September 15 | 75 kg |1.8 km
September 29 |73 kg | 2.1 km

#### Table-specific tags:

```
 <table>...</table>
```

Contains the table data, and defines the table structure.

```
 <thead>...</thead>
```
	
The head of the table (bolder text) - optional.

```
 <tr>...</tr>
```
	
Defines a row.
  
```
 <th>...</th>
 <td>...</td>
```

Defines a cell within that row (`th` inside thead, `td` inside tbody).

```
 <tbody>...</tbody>
```
	
The body of the table   

> **REMEMBER**: Don't use tables to define the layout of a page! 

<br>

## Inspector in Google Chrome Developer Tools

Let us have a quick first look at **Chrome Developer Tools**. Available as a console in Google Chrome, it allows us to get a lot of information about the page we're on, providing a detailed look into the HTML structure of the page and the CSS styling, among other things. 

In Chrome, you can access it with `Cmd+Alt+i`, or right-click "Inspect element".

As of now, let's mainly look at the "Elements" tab, it's a very powerful way to look at the page structure, and locate specific elements within the page.

You can also gain some useful information on all of the elements by looking at the data on the right column of the console, most notably the CSS properties currently applied to the elements... and change them "live" (these changes, however, only apply to the page as displayed - it will not be saved in your CSS file, and all these changes disappear on the next page reload). 

We will get to play with this functionality more as we dig deeper into the CSS chapter. 

<br>

## Closure

Summary of the lesson.

<br>

## Questions

Any questions?

<br>

### Additional resources

HTML:

- [Online HTML live editor](https://thimble.webmaker.org/en-US/projects/wrangler/)
- [HTML element reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
- [HTML5 element reference](https://developer.mozilla.org/en/docs/Web/Guide/HTML/HTML5/HTML5_element_list)
- [Tim Berners-Lee](http://www.w3.org/People/Berners-Lee/)
- [Semantic HTML](http://en.wikipedia.org/wiki/Semantic_HTML)

<br>