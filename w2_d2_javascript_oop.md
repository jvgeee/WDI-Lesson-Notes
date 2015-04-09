
Objects in JavaScript
=====

In JS, we solve both of these with a concept called an object. Objects are like
hashes in Ruby in that they have key / value pairs, but they are different in
that we can access their properties using hash or dot-notation.

Additionally, since functions are closures, we can use them in JS to build
methods on objects.

They are different from ruby objects / clases in that they don't support
class-based inheritance. Instead they use prototypes, which we'll cover at a
later date.


<br>

### Creating / Using

Demo creating a car object using literal syntax.

```
var car = {
  model: "Honda",
    color: "Red",
  speed: 0,
};

car.model;
car["model"];
prop = "color";
car[prop];
```

Demo making a car with methods:

```
var car = {
  model: "Honda",
  color: "Red",
  speed: 0,
  drive: function() {
    console.log("Vroooooooom!");
  },
  gas: function() {
    this.drive();
    this.speed += 10;
  }
};
```

Explain what `this` is. It's basically self in ruby.

Enumerate over object properties with:
* for...in loops
* Object.keys(obj)
* Object.getOwnPropertyNames(obj)

Explain the meaning of hasOwnProperty()


#### Deeper into This

Create a person object with a name, species and things eaten. Have it 'steal'
the speak method from our monkey and notice that it

### Constructor Methods


### Make a car constructor

Cars have:

Properties:
make
model
color
speed (0 initially)
maxSpeed

Methods:
accelerate(amt) - increase speed upto maxSpeed
slowDown(amt) - decrease speed by amount (not less than 0)
repaint(newColor)


### Constructors in Javascript

```
function Student(name, gender, age, grade, teacher){
  this.name = name;
  this.gender = gender;
  this.age = age;
  this.grade = grade;
  this.teacher = teacher;
}

var bob = new Student("bob", "male", 15, 10, "Gerry")
alert(bob.age); //Outputs 15
```

From this example we can see that instances of the class are initiated using the new operator. Properties and methods of the class are accessed using the . (dot) operator. So to get the property age of the instance of the Student class named bob, we simply use bob.age. Similarly, we created an instance of the Student class and assigned that to susan. To get the gender of susan, we simply use susan.gender. The code readability benefits from classes are enormous: You can reason that bob.age is the age of bob without having any programming experience.

However, the previous example contains two detrimental (but easily fixable) flaws.  
1) The class properties can be accessed by any statement  
2) The arguments must be passed in a certain order


###  Keeping property values private

Note that in the previous example, we were able to get the value of bob.age by simply calling bob.age. Additionally, we could set bob.age to any value we feel like anywhere in the program.

      var bob = new Student("bob", "male", 15, 10, "Marlow");
      alert(bob.age); //Outputs 15

      bob.age = 9;
      alert(bob.age); //Outputs 9;

Seems harmless, right? Well, consider this example.

      var bob = new Student("bob", "male", 15, 10, "Marlow");
      alert(bob.age); //Outputs 15

      bob.age = -50;
      alert(bob.age); //Outputs -50;

We have age as a negative number: A logical inconsistency. We can prevent issues like this and preserve the integrity of our data by utilizing the concept of private variables. A private variable is a variable that can only be accessed within the class itself. While once again JavaScript does not have a reserve word for making a variable private, JavaScript gives us the tools to create the same effect.

      function Student(name, gender, age, grade, teacher)
      {
        var studentName = name;
        var studentGender = gender;
        var studentGrade = grade;
        var studentTeacher = teacher;
        var studentAge = age;

        this.getAge = function()
        {
          return studentAge;
        };

        this.setAge = function(val)
        {
          studentAge = Math.abs(val); //Keep age positive using absolute value
        };
      }

      var bob = new Student("bob", "male", 15, 10, "Marlow");
      alert(bob.studentAge); //undefined, since age is privately protected in the class definition

      alert(bob.getAge()); //Outputs 15
      bob.setAge(-20);
      alert(bob.getAge()); //Outputs 20

By using variable declarations as opposed to attributing properties directly to the class, we have protected the integrity of our age data. Since JavaScript utilizes function scope, a variable declared within our class will not be made accessible outside of that class unless explicitly returned by a function within the class. The method this.getAge, which returns the student age to the calling environment, is known as an Accessor method. An Accessor method returns the value of a property so that the value can be used outside the class without affecting the value inside the class. Accessor methods are usually preceded with the word "get" by convention. The method this.setAge is known as a Mutation method. Its purpose is to alter the value of a property and preserve its integrity.

So we see the benefits of using Accessor and Mutation methods within a class to preserve the integrity of data. However, creating an Accessor method for each property creates extremely long-winded code.

      function Student(name, gender, age, grade, teacher)
      {
        var studentName = name;
        var studentGender = gender;
        var studentGrade = grade;
        var studentTeacher = teacher;
        var studentAge = age;

        this.getName = function()
        {
          return studentName;
        };

        this.getGender = function()
        {
          return studentGender;
        };

        this.getGrade = function()
        {
          return studentGrade;
        };

        this.getTeacher = function()
        {
          return studentTeacher;
        };

        this.getAge = function()
        {
          return studentAge;
        };

        this.setAge = function(val)
        {
          studentAge = Math.abs(val); //Keep age positive using absolute value
        };
      }

      var bob = new Student("bob", "male", 15, 10, "Marlow");
      alert(bob.studentGender); //undefined, since gender is privately protected in the class definition

      alert(bob.getGender()); //Outputs 'male'

My C++ Professor always said "If you find yourself typing the same code over and over, you're doing it wrong." Indeed there is a more efficient way to create Accessor methods for each property. Additionally, this mechanism also eliminates the need to call function arguments in a specific order.

### Dynamically Generated Accessor methods

This demonstration is based off John Resig's Pro JavaScript Techniques book (which I highly encourage you to read. The first 3 chapters alone are worth it).

      function Student( properties )
      {
        var $this = this;  //Store class scope into a variable named $this

        //Iterate through the properties of the object
        for ( var i in properties )
        {

          (function(i)
          {
            // Dynamically create an accessor method
            $this[ "get" + i ] = function()
            {
              return properties[i];
            };
          })(i);
        }
      }

      // Create a new user object instance and pass in an object of
      // properties to seed it with
      var student = new Student(
      {
        Name: "Bob",
        Age: 15,
        Gender: "male"
      });

      alert(student.name); //Undefined due to the property being private

      alert(student.getName()); //Outputs "Bob"
      alert(student.getAge()); //Outputs 15
      alert(student.getGender()); //Outputs "male"

By implementing this technique, not only do we keep our properties private, we avoid the need to specify our arguments in order. The following class instantiations are all equivalent

      var student = new Student(
      {
        Name: "Bob",
        Age: 15,
        Gender: "male"
      });

      var student = new Student(
      {
        Age: 15,
        Name: "Bob",
        Gender: "male"
      });

      var student = new Student(
      {
        Gender: "male",
        Age: 15,
        Name: "Bob"
      });

