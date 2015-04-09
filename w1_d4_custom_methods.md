Custom methods
=====

##Opening: Functional programming

Working with the built in methods of simple and complex data types (strings, integers, floats, arrays and hashes) is great and they offer us some really great functionality for free. However, we often want to create our own methods to send them to our own objects.

####Ask the class: Why do we need functions?

Some reasons might include:

- We might want to re-use sections of code
- Easier to manage
- Easier to test
- Easier to scan read as it's modular 

#### Keep your code DRY

DRY - is a guiding principle of coding (especially in Ruby).

- **D**on't 
- **R**epeat 
- **Y**ourself

The opposite is WET:

- **W**rite **E**verything **T**wice 
- **W**e **E**njoy **T**yping

<br>

##We do: Custom methods

#### Create new file in working directory

```
$ touch custom_methods.rb
$ subl custom_methods.rb
```
  
Add this code:

```
def say_hello
  "hello"
end
  
puts say_hello
```

We don't have to add parentheses `()` in order to call this method.

Run this code using:

```
$ ruby custom_methods.rb
```

The file will run from top to bottom and execute the custom method at the bottom of the page.

#### Main

> We have to send messages to objects though?! 

I hear you scream. So, what is the `say_hello` method being called upon? When an object isn't explicitly named, the the method is called on `self`.

Everything in Ruby occurs in the context of some object. The object at the top level is called ```main```. It's basically an instance of the ```Object``` class with the special property that any methods defined there are added as instance methods of Object (so they're available everywhere).

<br>

##We Do: A closer look at arguments 

Custom methods you write in Ruby can take zero or more arguments. However, when you call a Ruby method, you have to supply the correct number of arguments.  

#### Creating an Argument Error 

Lets use the method ```.gets``` to get a users name and pass an argument to the ```say_hello``` method.

But let's not call the method with an argument.

```
# In custom_methods.rb

def say_hello(name)
  "hello #{name}"
end
  
user = gets.chomp
puts say_hello()
```
  
Should give you:

```
custom_methods.rb:8:in `say_hello': wrong number of arguments (0 for 1) (ArgumentError)
```

#### Fixing an Argument Error 

Let's fix that by passing in user into the method:

```
def say_hello(name)
  "hello #{name}"
end

user = gets.chomp
puts say_hello(user)
```

<br>

##We Do: Default values for arguments

We can set a default value for an argument:

```
def say_hello(name="Alex")
  "hello #{name}"
end

puts say_hello
```

<br>

##We Do: Splat arguments

This syntax also allows you to take any number of arguments.

Add this:

```
def say_hello(*names)
  "hello, #{names.join(', ')}"
end

puts say_hello "Alex", "James", "John", "Dave"
```

Despite the fact that you have to include the correct number of arguments when you call a method in Ruby, the splat gives a way of getting around it. 

```
def say_hello(*names)
  puts "hello, #{names.join(', ')}"
end

puts say_hello
```

#### Using a splat as a 'sponge'

You can also use a splat as a 'sponge' argument:

```
def mixed_args(a,b,*c)
  puts "Arguments:"
  p a,b,c
end
  
mixed_args(1,2,3,4,5,6,7,8)
```

The splat will sponge up everything after the first two arguments:

```
Arguments:
1
2
[3, 4, 5, 6, 7, 8]
```

<br>

##I Do: Order of parameters and arguments

A small aside, what would you expect from this code?

```
def mixed_args(a,b,*c,d)
  puts "Arguments:"
  p a,b,c,d
end
  
mixed_args(1,2,3,4,5,6,7,8)
```

Would it break? This is what is produced:

```
Arguments:
1
2
[3, 4, 5, 6, 7]
8
```

Basically Ruby tries to assign the 'named' variables first from the left hand side and then backwards from the right. Then the sponge parameter grabs the rest of the arguments.

<br>

##I Do: Good method names

When writing method names and naming arguments, PLEASE make them descriptive. Ideally, you shouldn't need to write any comments.

Take this:

```
def a(f,s)
  f + s
end
  
a(2,3)
```
  
Or:

```
def add(first_number, second_number)
  first_number + second_number
end

add(2, 3)
```

Which is easier to read?

<br>

##Closure

We will look into the difference betwen a *Class Method* and an *Instance Method* in one of the lessons coming up in the next few days. At the moment, it's okay to define your methods on the ```main```. 

<br>