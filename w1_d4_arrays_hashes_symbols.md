Symbols, arrays and hashes
=====

##Opening: Review of data types

We've already seen a few basic data types. 

Can you remember them?

- Integers
- Floats
- Strings
- Booleans

However, you might not only want to deal with one object at a time. Sometimes, you want to deal with a collection of objects.

<br>

##I Do: What is a symbol?

Before that, another data type that you will see in Ruby is a symbol which is a bit like a string. They are often used as names of things.

You define them using a colon:

```
$ irb

a = :hello
```
  
Or using the colon-string syntax (which is not as common).
  
```
b = :"hello"
```

However, in Ruby, a string is mutable, whereas a symbol is immutable. 

```
"string" << "another"
=> "stringanother"
  
:string << "another"
NoMethodError: undefined method `<<' for :string:Symbol
```

That means that only one copy of a symbol needs to be created. Thus, if you have:

```
$ irb
  
x = :my_str
=> :my_str
  
y = :my_str
=> :my_str
  
x.object_id
=> 538728
  
y.object_id
=> 538728
```

```:my_str``` will only be created once, and `x` and `y` point to the same area of memory. On the other hand, if you have

```
x = "my_str"
=> "my_str"
  
y = "my_str"
=> "my_str"
  
x.object_id
=> 70182925514500
  
y.object_id
=> 70182925532900
```

A string containing ```my_str``` will be created twice, and `x` and `y` will point to different instances.

This means that code that uses symbols often acts a bit faster.

<br>

##I Do: What is an array?

Let's look at another data type, an array (a composite data type).

- An array is an **ordered collection of objects**. 
- But an array is also an object in Ruby

(Everything in Ruby is an object).

If you want to read more about arrays, here is a link to the [docs](http://ruby-doc.org//core-2.2.0/Array.html)... RTFM.

#### What are arrays useful for?

When writing programs, you will often deal with lots off pieces of information (from APIs or databases), so you need ways of organising and manipulating that data.

<br>

##We Do: Creating arrays

#### Write on the board:

You can create an array using one of 4 methods:

- With the literal array constructor `[]` (square brackets)
- With the array literal notation `%w{...}`, `%w()`, and ```%i{...}```
- With the `Array.new` method

There is one other very rare method:

- With a top-level method called `Array()`, Array(string)

### Literal array constructor 

The most common way of defining an array is the literal array constructor, or square brackets.

```
$ irb
  
[]
[].class
=> Array
```
  
Inside an array, you can put any Ruby object. They DON'T have to be the same type of object.

```
$ irb
  
array = [1, 2, 3, 4]
array
=> [1, 2, 3, 4]
  
array = ["Ben", "James", 2]
array
=> ["Ben", "James", 2]
```

### String literal notation

The other common way of defining an array is using string literal notation:

```
array = %w(Ben James John)
=> ["Ben", "James", "John"]
  
# or
  
array = %w{Ben James John}
array => ["Ben", "James", "John"]
```

This syntax was inspired by the Perl programming language.

### Array.new

As an array is an object, each new array is an instance of an Array Class. So we can create it with a special method called ```.new``` which instantiates a new instance of the array class:

```
Array.new(3)
=> [nil, nil, nil]
```

The second argument in ```Array.new``` is the object that you want to repeat.

```
Array.new(3, "hello")
=> ["hello", "hello", "hello"]
```
  
This is not as common as the previous two.

[i]: Optionally go through this.

### Array()

The last way of creating an array in Ruby is using the top-level method provided by Kernal, you don't need to do this often:

```
Array()
```

Basically ```.to_ary``` and then ```.to_a``` is called on the argument.

### Multi-dimensional arrays

As an array can contain any type of object, they can also contain other arrays, like this:

```
[[1,2,3,4],[4,5,6,7],[7,8,9,10]]
=> [[1,2,3,4],[4,5,6,7],[7,8,9,10]]
```

<br>

##We Do: Getting and setting using index values

### Getting

#### Draw on board

```
array = ["a", "b", 3, "chair", [], "robot"]
index =   0    1   2     3     4      5
```

Each object in an array is numbered, this number is called the index.

Like any large collection of information (like a library), arrays have an index, which means you can easily access any object inside it using it's index value.

**However, the index starts at 0, not 1.**

To **get** the value of a specific index (remember it starts at 0) we use can use the syntax:

#### Draw on board

```
array[index]
=> value
```

I know this is confusing because you are using square brackets to define an array and then square brackets to get an element.

```
array = [1,2,3,4,5]
  
array[0] 
=> 1
```
    
You can lookup in reverse using negative indexes

```
array[-1]
=> 5
```
  
You can access a subarray using a start, end index

```
# The syntax is: array[start, end]

array = [1,2,3,4,5]
array[1,3]
=>  [2, 3, 4]
```
  
### Setting

You can also **set a new value** using this syntax

```
array[0] = "meh"
  
array
=> ["meh", 2, 3, 4, 5]
```
  
<br> 

##Assess

So, remember the multidimensional array... saved using the variable: array

```
array
=> [[1,2,3,4],[4,5,6,7],[7,8,9,10]]
```

How do we show what object is found at index 1 of the array, which is found at the index 1 in the multi-dimensional array?

```
array[1][1]
=> 5
```
  
<br>

##I Do: What is a hash?

Like an array, a hash is also a collection of objects. A hash consists of key/value pairs, where any key and any value can be any Ruby object. 

Hashes let you perform lookup operations based on keys, a reason why they are sometimes referred to as dictionaries.

Remember a hash is also an object (everything is an object in Ruby).

#### Draw on board

```
hash { key => value }
```

<br>

##We Do: Creating hashes

#### Write on the board:

You can create a hash using one of 4 methods:

- With the literal constructor, ```{}```
- With the ```Hash.new``` method
- With the ```Hash.[]``` method (a square-bracket method of Hash)

Rare:

- With the top-level method whose name is ```Hash```

### Literal constructor 

When you type out a literal hash inside curly braces, you seperate keys from values with the ```=>``` operator

```
$ irb

h = {}
=> {}
  
h.class
=> Hash
```
  
We can also create "Hash Literals"; that is, Hashes that are pre-populated with key-value pairs:

```
hash = {:top => 5, :right => 6, :bottom => 10, :left => 10}
=> {:top=>5, :right=>6, :bottom=>10, :left=>10}
```
    
The ```=>``` sign is sometimes referred to as a 'hash rocket' or – a little uncaring – a 'fat arrow', and is used to indicate the association of a key and its value.

And if all the keys of my Hash are symbols, then I can use this syntax:

```
hash = {top: 5, right: 6, bottom: 10, left: 10}
=> {:top => 5, :right => 6, :bottom => 10, :left => 10}
```
    
You don't have to use symbols as keys:

```
hash = {"a" => b, b: "c"}
=> {"a"=>:hello, :b=>"c"}
```
  
### Hash.new

```
Hash.new
=> {}
```

```Hash.new``` instantiates a new hash. If you give 

### Hash.[]

You can also define a hash by passing an even number of parameters into the `.[]` class method of the Hash class:

```
Hash["a", "b", "c", "d"]
=> {"a"=>"b", "c"=>"d"}
```

This is actually syntactic sugar for:

```
Hash.[]("a", "b", "c", "d")
```

This is not very common.

[i]: Optional

### Hash

You can also define a hash using the top-level Kernal method ```Hash```:

```
Hash([])
=> {}
  
Hash(nil)
=> {}
```
  
You almost never seen this.

<br>

##We Do: Getting, inserting and removing from a hash

### Getting

#### Draw on board

```
hash[key]
=> value
```

We can access the values in a hash using the key values.

```
h = {a: "hello", b: "we", c: "love", d: "hashes"}
h[:a]
=> "hello"
```
  
There is also a method called ```.fetch```

```
h.fetch(:a)
```
  
Fetch is different than using ```[]``` because if you try to fetch a key that isn't there, then ```fetch``` will raise an array:

```
h[:e]
=> nil
  
h.fetch(:e)
KeyError: key not found: :e
```
  
If you add a second arguement to fetch, that argument will be returned instead of an exception/

```
h.fetch(:e, "unknown value")
=> "unknown value"
```
  
### Inserting

#### Draw on board

```
hash[key] = value
```

You can insert values into a hash:

```
$ irb

hash = {}
hash[:new] = "hi"
=> "hi"
  
hash[:second] = "roar"
=> "roar"
  
hash
=> {:new=>"hi", :second=>"roar"}
```

And reset values using the same syntax:

```
hash[:new] = "bye"
  
hash
=> {:new=>"bye", :second=>"roar"}
```

<br> 

##Closure

We've gone through what a symbol, array and a hash are and how to create them. These really will be some of the most useful tools you have to play with as a coder.

<br> 