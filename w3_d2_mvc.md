MVC
=====

## Opening

MVC is a software architecture - the structure of the system - that separates application/business logic from the rest of the user interface. It does this by separating the application into three parts: 

#### Draw on board

- the **M**odel
- the **V**iew
- the **C**ontroller.

#### MVC Diagram

![image](mvc.gif)

There are quite a lot of MVC diagrams.

### Model

The model manages fundamental behaviors and data of the application. It can respond to requests for information, respond to instructions to change the state of its information, and even to notify observers in event-driven systems when information changes. This could be a database, or any number of data structures or storage systems. In short, it is the data and data-management of the application.

### View

The view effectively provides the user interface element of the application. It'll render data from the model into a form that is suitable for the user interface.

### Controller

The controller receives user input and makes calls to model objects and the view to perform appropriate actions.

All in all, these three components work together to create the three basic components of MVC.

<br>

## I Do: Seperation of concerns

The core idea behind MVC pattern is [Separation of Concerns](https://en.wikipedia.org/wiki/Separation_of_concerns).

<br>

## I Do: Fat model skinny controller

Play this [video](https://www.youtube.com/watch?v=91C7ax0UAAc)

<br>

## I Do: Skinny everything

No class should be fat. Ever. There is no need for your controllers, models or views to be fat; this shows laziness, as there's been no thought given to the application's design outside of deciding to use a particular framework.

<br>

## I Do: MVC as a story

It’s more fun to imagine the explaination of MVC as a story with a few characters:

- a **fat assistant** (fat model)
- a **skinny manager** (skinny controller)
- a **good looking sales rep**" (well designed view)

Rather than a boring “3-tiered MVC architecture”. 

- Models do the grunt work 
- Views are the happy face
- Controllers are the masterminds behind it all.
 
Many MVC discussions also ignore the role of the web server. However, it’s important to mention how the controller gets created and passed user information. 

The web server is the shopping small, a  gateway where everything is located, in which people move data back and forth: users never interact with the controller directly, always via a request.

#### An MVC story

- First, the **browser makes a request**, such as http://alexchin.co.uk/videos/show/15

> A customer decides they want to buy something from a business.

- Then the web server (Heroku, 1and1, Amazon etc.) receives the request.

> The customer walks into the business where the business is located (like a shopping center).

- The server routes the request to find out which controller to use: the default route pattern is `“/controller/action/id”`. In the case above, it’s the “`videos`” controller (controllers should be plural), method “`show`” with an id of “`15`″. The web server then uses the dispatcher to create a new controller, call the action and pass the parameters.

> The customer asks someone from the shopping center, *"I'd like to get a video with an id of 15, where would I find that?"* The shopping mall assistant looks at the map given to them by the shop and says, *"Over there dude!"*

* Controllers do the work of **parsing user requests**, **data submissions**, **cookies**, **sessions** and the “browser stuff”.  In our case (http://alexchin.co.uk/videos/show/15), the show action in the video controller knows it needs to lookup a video. It asks the model to get video 15, and will eventually display it to the user.

> The customer meets the controller, a slick-haired manager that orders employees around. The controller gives orders without knowing (or caring) how it gets done. When the assistant goes to get a video the controller grabs it off the model and then gives it to the customer.

* Models are Ruby classes that represent objects. They **talk to the database**, **store and validate data**, perform the **business logic** and otherwise do the **heavy lifting**. In our case, the model retrieves video 15 from the database.

> Think of models as the people who stack the shelves in the shop. They do all the work to sort and grab things when you need them to. They pick up the objects and sort them out (even more because of Ruby's use of DSL instead of SQL). You can think of the database as the actual shelves where the products are stored. 

* Note: "Beware... if the shop assistant gets too fat, he won't be able to get around the shop. I think the skinny manager might prefer lots of skinny assistants to one fat one..."

* Views are what the user sees: **HTML, CSS, XML, Javascript, JSON**. In our example, the controller gives video 15 to the “show” view. The show view generates the HTML: divs, tables, text, descriptions, footers, etc.

> Sometimes, you can think of the views as the actual product... But you can also think of a view like a sales rep. They are often responsible for putting up flyers and collecting surveys. However, they work completely at the manager’s direction. Views are merely puppets reading what their manager (the controller) gives them. They don’t know what happens in the back room. (They probably live for the weekend!)

* The controller also returns the response body (HTML, XML, etc.) & metadata (caching headers, redirects) to the server. The server combines the raw data into a proper HTTP response and sends it to the user.

##Closure

Summary of lesson.

<br>