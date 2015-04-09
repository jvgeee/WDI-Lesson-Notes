

Scope in javascript
=====

## What is Scope ?

The JavaScript language has a few concepts of "scope", none of which are straightforward or easy to understand as a new JavaScript developer (and even some experienced JavaScript developers). This post is aimed at those wanting to learn about the many depths of JavaScript after hearing words such as `scope`, `closure`, `this`, `namespace`, `function scope`, `global scope`, `lexical scope` and `public/private scope`.

In JavaScript, scope refers to the current context of your code. Scopes can be _globally_ or _locally_ defined. Understanding JavaScript scope is key to writing bulletproof code and being a better developer. You'll understand where variables/functions are accessible, be able to change the scope of your code's context and be able to write faster and more maintainable code, as well as debug much faster.

Thinking about scope is easy, are we inside `Scope A` or `Scope B`?


### Scope types

#### Global scope

Before you write a line of JavaScript, you're in what we call the `Global Scope`. If we declare a variable, it's defined globally:

    // global scope
    var name = 'Todd';

Global scope is your best friend and your worst nightmare, learning to control your scopes is easy and in doing so, you''ll run into no issues with global scope problems (usually namespace clashes). You'll often hear people saying "Global Scope is _bad_", but never really justifying as to _why_. Global scope isn't bad, you need it to create Modules/APIs that are accessible across scopes, you must use it to your advantage and not cause issues.


#### Local scope


A local scope refers to any scope defined past the global scope. There is typically one global scope, and each function defined has its own (nested) local scope. Any function defined within another function has a local scope which is linked to the outer function.

If I define a function and create variables inside it, those variables becomes locally scoped. Take this example:

    // Scope A: Global scope out here
    var myFunction = function () {
      // Scope B: Local scope in here
    };

Any locally scoped items are not visible in the global scope - _unless_ exposed, meaning if I define functions or variables within a new scope, it's inaccessible _outside_ of that current scope. A simple example of this is the following:

    var myFunction = function () {
      var name = 'Todd';
      console.log(name); // Todd
    };
    // Uncaught ReferenceError: name is not defined
    console.log(name);

The variable `name` is scoped locally, it isn't exposed to the parent scope and therefore undefined.

#### Function scope


All scopes in JavaScript are created with `Function Scope` _only_, they aren't created by `for` or `while` loops or expression statements like `if` or `switch`. New functions = new scope - that's the rule. A simple example to demonstrate this scope creation:

    // Scope A
    var myFunction = function () {
      // Scope B
      var myOtherFunction = function () {
        // Scope C
      };
    };

It's easy to create new scope and create local variables/functions/objects.

#### Lexical Scope

Whenever you see a function within another function, the inner function has access to the scope in the outer function, this is called Lexical Scope or Closure - also referred to as Static Scope. The easiest way to demonstrate that again:

    var myFunction = function () {
      var name = 'Todd';
      var myOtherFunction = function () {
        console.log('My name is ' + name);
      };
      console.log(name);
      myOtherFunction(); // call function
    };

    // Will then log out:
    // `Todd`
    // `My name is Todd`


Lexical scope is easy to work with, _any_ variables/objects/functions defined in _it's_ parent scope, are available in the scope chain. For example:

    var name = 'Todd';
    var scope1 = function () {
      // name is available here
      var scope2 = function () {
        // name is available here too
        var scope3 = function () {
          // name is also available here!
        };
      };
    };

The only important thing to remember is that Lexical scope does _not_ work backwards. Here we can see how Lexical scope _doesn't_ work:

    // name = undefined
    var scope1 = function () {
      // name = undefined
      var scope2 = function () {
        // name = undefined
        var scope3 = function () {
          var name = 'Todd'; // locally scoped
        };
      };
    };

I can always return a reference to `name`, but never the variable itself.


### Self-Executing Anonymous Functions


When learning JavaScript, with all the attention given to variables, functions, 'if' statements, loops and event handlers, often little is done to educate you on how you might cleanly organise your code into a cohesive, structurally-sound whole.

Let's take the following code for example:



    var foo = 'Hello';
    var bar = 'World!';

    function baz(){
      return foo  + ' ' + bar;
    }

    console.log(baz());


This style of code looks quite normal, works fine and doesn't cause any problems. At least for now.

This style of code, when implemented in a large application, can start to become an unwieldy mess. The global namespace becomes littered with functions and variables, all tenuously linked to each other through a combination of rudimentary comments and potentially unspoken developer knowledge.

The first step on the journey to beautiful, modular JavaScript is to learn the art of the self-executing anonymous function.



    (function(){
      console.log('Hello World!');
    })();


Let's look at this carefully. This code is made up of two key parts.

First is the anonymous function:


    (function(){
      //Normal code goes here
    })

 |

The really interesting part is what happens when we add this right at the end:

    ();

Those two little brackets cause everything contained in the preceding parentheses to be executed immediately. What's useful here is that JavaScript has function level scoping. All variables and functions defined within the anonymous function aren't available to the code outside of it, effectively using closure to seal itself from the outside world.

Let's apply this design patten to our gloriously inane example code.


    (function(){
      var foo = 'Hello';
      var bar = 'World!'

      function baz(){
          return foo + ' ' + bar;
      }
    })();

     //These all throw exceptions:
    console.log(foo);
    console.log(bar);
    console.log(baz());

 |

The last three lines throw exceptions because currently nothing is accessible outside the anonymous function. To allow access to a variable or function, we need to expose it to the global 'window' object.


    (function(){
      var foo = 'Hello';
      var bar = 'World!'

      function baz(){
          return foo + ' ' + bar;
      }

      window.baz = baz; //Assign 'baz' to the global variable 'baz'...
    })();

    console.log(baz()); //...and now this works.

    //It's important to note that these still won't work:
    console.log(foo);
    console.log(bar);

 |

One of the major benefits of this pattern, as seen on the last two lines of the previous example, is that you can limit access to variables and functions within your closure, essentially making them private and only choosing to expose an API of your choice to the global scope.

One popular spin on this design pattern, which can be seen in the [jQuery source][1], is to pass in some commonly used objects. In our code we reference 'window', so let's pass that in as a parameter to the anonymous function.






### Closures

Closures ties in very closely with Lexical Scope. A better example of how the _closure_ side of things works, can be seen when returning a _function reference_ \- a more practical usage. Inside our scope, we can return things so that they're available in the parent scope:

    var sayHello = function (name) {
      var text = 'Hello, ' + name;
      return function () {
        console.log(text);
      };
    };

The `closure` concept we've used here makes our scope inside `sayHello` inaccessible to the public scope. Calling the function alone will do nothing as it _returns_ a function:

    sayHello('Todd'); // nothing happens, no errors, just silence...

The function returns a function, which means it needs assignment, and _then_ calling:

    var helloTodd = sayHello('Todd');
    helloTodd(); // will call the closure and log 'Hello, Todd'

Okay, I lied, you _can_ call it, and you may have seen functions like this, but this will call your closure:

    sayHello2('Bob')(); // calls the returned function without assignment



A function doesn't _have_ to return in order to be called a closure though. Simply accessing variables outside of the immediate lexical scope creates a closure.

