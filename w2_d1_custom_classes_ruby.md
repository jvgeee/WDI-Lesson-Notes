Custom Classes
=====

##Opening

We know that we can create an object using the one-at-a-time  ```Object.new```:

  $ irb
  Object.new
  => #<Object:0x007fd0f126cb58>

However, we want to be able to design our own objects with classes so we can create lots of them.

#### How to make objects the same but different?

Everyone in the room is an example of a Person class, however we all have different names.

We need a way of creating new objects and storing different information inside each object so that they can become individual.

Information and data associated with an object embodies the **state** of that object. We need to be able to:

#### Draw on board

- **Set**, or reset the state of an object (Say to a person, your name is "Dave")
- **Get**, read back the state (What is your name? It's "Dave")

<br> 

##I Do: Instance variables

Luckily Ruby objects come with their own storage and retrieval mechanism for these types of values, called **instance variables**.

Instance variables work exactly the same as standard variables, you assign values to them, do things with them and read them back. However, they have a few differences:

- Start with an ```@``` sign
- Are only visible to the object to which they belong
- An instance variable defined in a class can be used in any other method in that class.

<br>

##We Do: Getting an setting an instance variable

Create a new file and open it in Sublime:

```
$ touch person.rb
$ subl person.rb
```

Let's create a class:

```
class Person
end
```
  
Now, let's add a couple of instance methods to that class:

```
class Person 
   
  def set_name(string)
    puts "Setting person's name..."
    @name = string
  end
      
  def get_name 
    puts "Returning person's name..."
    @name
  end

end
```

Underneath the class definition, let's do something with it.
First we need to instantiate a new person
  
```
bob = Person.new
bob.set_name("Bob")
puts bob.get_name
```
  
Then run with ruby.

```
$ ruby person.rb
```

Great, we have just done what is called '**getting**' and '**setting**'. However, there are a few more idiomatic ways to do this.

#### Instance methods

Notice, that we are calling this ```set_name``` method on an instance of person. This is an **instance method**.

<br>

##We Do: The initialize method
  
Add this an ```initialize``` method to your class:

```
class Person 

  def initialize(name)
    @name = name
  end

  # def set_name(string)
  #   puts "Setting person's name..."
  #   @name = string
  # end

  def get_name 
    puts "Returning person's name..."
    @name
  end

end
```
  
Everytime you instantiate a new instance by calling ```.new``` the ```initialize``` method will run. However, it does mean that ```.new``` will now need to take a new argument:

You can think of ```.new``` as a sort of alias for ```.initialize```.

```
bob = Person.new("Bob")
puts bob.get_name
```
  
**Note**: The name of the variable being passed into the ```.initialize``` method and the instance variable don't need to be the same.
  
#### Refactor get_name

We're using ```get_name``` to return us the name, however it makes more sense to just use ```name```. Let's refactor:

```
def name 
  @name
end
```

This is a convention, it now means we can write:

```
bob = Person.new("Bob")
puts "Person's name is #{bob.name}"
```

<br>

##We do: Both setter methods and initialize

Sometimes, you might not want to assign all instance variables at the point of creating. Therefore you can mix a combination of ```initialize``` and setter methods:

Add:

```
def set_age(age)
  @age = age
end
```

With a getter method too: 

``` 
def age
  @age 
end
```

You can call this at the bottom with:

```
bob.set_age(20)
puts "#{bob.name}'s age is #{bob.age}"
```

#### Define with =

Ruby allows us to do something really cool though as it allows methods to be defined with certain special characters, like ```=```.

Refactor the code to say:

```
def age=(age)
  @age = age
end
```

And: 

```
bob.age=(20)
```

#### Syntactic Sugar

Ruby goes one further and lets us do:

```
bob.age = 20
```

How amazing is that!

<br>

##We Do: Attributes and the attr_* method family

> <cite>An attribute is a property of an object whose value can be read and/or written through an object.</cite>

When we set values, using a setter method, we can also describe this as an **attribute writer** method. 

When we get values, using a getter method, we can describe this as an **attribute reader** method.

#### attr_reader

We can refactor our getter methods to this:

```
attr_reader :name, :age
```

And we can comment out the methods:

```
# def age
#  @age 
# end
```

And run with:

```
$ ruby person.rb 
```
  
And have a look.
 
#### attr_writer

We can refactor our setter method to this:

```
attr_reader :name, :age
attr_writer :age
```
    
And we can comment out the method.

```
# def age=(age)
#  @age = age
# end
```

#### attr_accessor

However, if we look at ```:age``` we can see that it's both an ```attr_reader``` and and ```attr_writer```. This makes it an ```attr_accessor```.

We can refactor:

```
attr_reader :name
attr_accessor :age
```

<br>

##We Do: Class variables

**Class variables** are variables which are shared between all instances of a class. Class variables are prefixed with two ```@``` characters (```@@```).

**Note**: Generally, class variables are considered a bad idea. Most of the time you don't need to use them.

Let's define a class variable:

```
@@count
```
  
It doesn't make sense that an instance method can change this value, althought it could. To work with this class variable, we should use a class method.

<br>

##We Do: Class methods

So far, all of these methods we have been creating have been ```instance methods```.

Let's define a class getter method:

```
def Person.count
  @@count
end
```

And in the initialize method, that only runs once, let's add:

```
@@count += 1
```
  
We can call this at the bottom using:

```
puts Person.count
```
  
Let's make it more obvious:

```
puts Person.count
Person.new("Dave")
puts Person.count
```

#### Self

The problem with defining a class method using the class name is that if you change the name, you have to change all the methods.

We can instead use the keyword ```self```

```
def self.count
  @@count
end
```
    
```self``` refers to the object that you are currently inside, in this case the class itself.    
  
<br>

##I Do: Class Constants

Lastly, when you know you have some information that is not going to change in your class, you can use a constant.

It is defined without using ```@``` or ```@@```. By convention, we write the name of class constants in all-caps.

```
DEFAULT_NUMBER_OF_LEGS = 2
```
  
You can access it outside the class using, double-colon syntax ```::```

```
puts Person::DEFAULT_NUMBER_OF_LEGS
```

Or inside the class using the variable

```
def initialize(name)
  @name = name
  @@count += 1
  puts "Number of Legs #{DEFAULT_NUMBER_OF_LEGS}"
end
```   
    
If you try to change the constant's value, it will work, which is a behavior that you probably only see in ruby, with every other language, if you try to re-assign the value of a constant, the program will throw an error, with ruby, only a warning will be raised. 

##Closure

We've gone through lots of concepts in this lesson. Read over the notes again and have a play with creating some custom classes.

<br>
