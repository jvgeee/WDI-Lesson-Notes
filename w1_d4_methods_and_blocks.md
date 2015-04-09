Methods and blocks
=====

##Opening: Introduction to methods

#### Ask class

What is everything in Ruby?

- An object.

Let's have a think about what that means. **Different objects can do different things**, or more precisely, **different objects understand how to do different things**. If I ask that table to "stand", then it would stand still because that's what it does. If I could control nature and I asked a bunny, "hop" - it would understand what that meant. 

However, some objects just wouldn't understand what I meant. If I asked an elephant to "fly" or indeed a pig, if I was being cliche. 

In Ruby, we call this idea "**sending an object a message**" or "**calling a method on an object**".

#### Talking to objects

So, as a Rubyist, one of your main jobs will be creating objects and then giving them abilities and asking them to perform actions. 

Ruby is an Object Orientated language, we will cover this more in a dedicated OOP lesson, but we're starting to tackle some of the ideas now.

<br>

##We Do: Sending a message

Open up irb.

```
$ irb
```
  
Remember, when we were looking at arrays and hashes. Well, just like a rabbit knows how to 'hop' and a mouse knows how to 'squeak', different data-types (also objects) in Ruby know how to do different things.

We can check this by using the method, ```.methods```

```
"".methods
=> [:<=>, :==, :===, :eql?, :hash, :casecmp, :+, :*, :%, :[], :[]=, :insert, :length, :size, :bytesize, :empty?, :=~, :match, :succ, :succ!, :next, :next!, :upto, :index, :rindex, :replace, :clear, :chr, :getbyte, :setbyte, :byteslice, :scrub, :scrub!, :freeze, :to_i, :to_f, :to_s, :to_str, :inspect, :dump, :upcase, :downcase, :capitalize, :swapcase, :upcase!, :downcase!, :capitalize!, :swapcase!, :hex, :oct, :split, :lines, :bytes, :chars, :codepoints, :reverse, :reverse!, :concat, :<<, :prepend, :crypt, :intern, :to_sym, :ord, :include?, :start_with?, :end_with?, :scan, :ljust, :rjust, :center, :sub, :gsub, :chop, :chomp, :strip, :lstrip, :rstrip, :sub!, :gsub!, :chop!, :chomp!, :strip!, :lstrip!, :rstrip!, :tr, :tr_s, :delete, :squeeze, :count, :tr!, :tr_s!, :delete!, :squeeze!, :each_line, :each_byte, :each_char, :each_codepoint, :sum, :slice, :slice!, :partition, :rpartition, :encoding, :force_encoding, :b, :valid_encoding?, :ascii_only?, :unpack, :encode, :encode!, :to_r, :to_c, :>, :>=, :<, :<=, :between?, :nil?, :!~, :class, :singleton_class, :clone, :dup, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :extend, :display, :method, :public_method, :singleton_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]
```

This is a list of all the methods that a string can do. 

What have we done here?

#### Draw on board:

```
obj.methods 
```
  
  
| **Section** | **Explanation** |
|-------------|------------|
| `obj` | This part is the object, the object we are sending the message to. (The receiver).
| `.` | This is called the 'Dot Operator'. It allows us to send a message to the object.
| `methods` | This is the method name. 

<br>

##We Do: Common string methods

So, with this in mind, let's think about a few common things that strings might need to do:

```
$ irb
  
"hello".length
=> 5
  
"hello".reverse
=> "olleh"

"hello".chars
=> ["h", "e", "l", "l", "o"]
  
"hello".capitalize
=> "Hello"
```
  
As you can see, some of the common things that you would want a string to be able to do has been built into the string class of Ruby.

How useful is that?!

<br>

##I Do: Methods that take arguments

Methods in Ruby can also take arguments:

```
"hello".index("e")
=> 1
  
"hello".is_a?(String)
=> true
```

We will look at this in a bit more depth when we write our own methods.

<br>

##I Do: Methods always return something

When you send a message to an object in Ruby, something ALWAYS gets returned. 

You can think of Ruby as being very polite. It will never ignore you.

<br>

##We Do: Syntactic Sugar

Okay, what about this one:

```
"hello" + "goodbye"
=> "hellogoodbye"
```

What on earth just happened here?

We said that when Ruby was being created and developed, Matz wanted to make programmers happy...

So we could re-write this methods to look like this:

```
"hello".+("goodbye")
=> "hellogoodbye"
```
  
Where the ```+``` is the method name.

However, because this is a hassle, Ruby let's you write it in a simpler way. This happens quite a lot in Ruby. You almost never have to think about it. But it is really important to understand.
  
#### Brackets or no brackets

Another example of syntactic sugar in Ruby is the fact that when a methods doesn't need an arguement for it to work, you don't have to add the brackets.

However, this is still valid Ruby:

```
"hello".length()
=> 5
```

<br>

##We Do: Chaining methods 

Let's make that long list of string methods slightly easier to read by sorting them.

```
"".methods.sort
=> [:!, :!=, :!~, :%, :*, :+, :<, :<<, :<=, :<=>, :==, :===, :=~, :>, :>=, :[], :[]=, :__id__, :__send__, :ascii_only?, :b, :between?, :bytes, :bytesize, :byteslice, :capitalize, :capitalize!, :casecmp, :center, :chars, :chomp, :chomp!, :chop, :chop!, :chr, :class, :clear, :clone, :codepoints, :concat, :count, :crypt, :define_singleton_method, :delete, :delete!, :display, :downcase, :downcase!, :dump, :dup, :each_byte, :each_char, :each_codepoint, :each_line, :empty?, :encode, :encode!, :encoding, :end_with?, :enum_for, :eql?, :equal?, :extend, :force_encoding, :freeze, :frozen?, :getbyte, :gsub, :gsub!, :hash, :hex, :include?, :index, :insert, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :intern, :is_a?, :kind_of?, :length, :lines, :ljust, :lstrip, :lstrip!, :match, :method, :methods, :next, :next!, :nil?, :object_id, :oct, :ord, :partition, :prepend, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :replace, :respond_to?, :reverse, :reverse!, :rindex, :rjust, :rpartition, :rstrip, :rstrip!, :scan, :scrub, :scrub!, :send, :setbyte, :singleton_class, :singleton_method, :singleton_methods, :size, :slice, :slice!, :split, :squeeze, :squeeze!, :start_with?, :strip, :strip!, :sub, :sub!, :succ, :succ!, :sum, :swapcase, :swapcase!, :taint, :tainted?, :tap, :to_c, :to_enum, :to_f, :to_i, :to_r, :to_s, :to_str, :to_sym, :tr, :tr!, :tr_s, :tr_s!, :trust, :unpack, :untaint, :untrust, :untrusted?, :upcase, :upcase!, :upto, :valid_encoding?]
```

We have seemingly called a method on a method, this is called 'chaining methods'.

However, let's think about this in a bit more detail:

```
"".methods
```

What is returned from this? 

- An array

So, if we do:

```
"".methods.class
=> Array
```
  
Which means what we are doing is actually using an array method on what was returned from ```"".methods```.

Is ```.sort``` actually included in ```"".methods```. Nope!

So, in Ruby you always have to think, "What object am I calling this method on?" Or, "What object am I sending this message?"

#### Assess

```
"hello".length.class.to_s.length
```

<br>

##We Do: Array methods

So, we have looked at a few string methods. Let's have a little look at some array methods.

Sanity check:

```
$ irb
  
[].methods.sort
=> [:!, :!=, :!~, :&, :*, :+, :-, :<<, :<=>, :==, :===, :=~, :[], :[]=, :__id__, :__send__, :all?, :any?, :assoc, :at, :bsearch, :chunk, :class, :clear, :clone, :collect, :collect!, :collect_concat, :combination, :compact, :compact!, :concat, :count, :cycle, :define_singleton_method, :delete, :delete_at, :delete_if, :detect, :display, :drop, :drop_while, :dup, :each, :each_cons, :each_entry, :each_index, :each_slice, :each_with_index, :each_with_object, :empty?, :entries, :enum_for, :eql?, :equal?, :extend, :fetch, :fill, :find, :find_all, :find_index, :first, :flat_map, :flatten, :flatten!, :freeze, :frozen?, :grep, :group_by, :hash, :include?, :index, :inject, :insert, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :is_a?, :join, :keep_if, :kind_of?, :last, :lazy, :length, :map, :map!, :max, :max_by, :member?, :method, :methods, :min, :min_by, :minmax, :minmax_by, :nil?, :none?, :object_id, :one?, :pack, :partition, :permutation, :pop, :private_methods, :product, :protected_methods, :public_method, :public_methods, :public_send, :push, :rassoc, :reduce, :reject, :reject!, :remove_instance_variable, :repeated_combination, :repeated_permutation, :replace, :respond_to?, :reverse, :reverse!, :reverse_each, :rindex, :rotate, :rotate!, :sample, :select, :select!, :send, :shift, :shuffle, :shuffle!, :singleton_class, :singleton_method, :singleton_methods, :size, :slice, :slice!, :slice_before, :sort, :sort!, :sort_by, :sort_by!, :taint, :tainted?, :take, :take_while, :tap, :to_a, :to_ary, :to_enum, :to_h, :to_s, :transpose, :trust, :uniq, :uniq!, :unshift, :untaint, :untrust, :untrusted?, :values_at, :zip, :|]
```
  
So let's have alook at some of the common array methods:

```
$ irb
  
a = [1,2,3,4]
=> [1, 2, 3, 4]
  
a.size
=> 4
  
a.length
=> 4
  
a.first
=> 1
  
a.last
=> 4
  
a.max
=> 4
  
a.min
=> 1
```
  
#### Push / Shift

To add an element to the end of an array, you use `push`

```
# a is still = [1,2,3,4]
  
a.push(5)
=> [1, 2, 3, 4, 5]
``` 
  
#### More syntactic sugar

Do you remember fetching and setting items from an array:

```
a[1]
=> 2

a.[](1)
=> 2
```
  
Or even more complicated:

```
a[0] = "a"
=> "a"
  
# Is the same as: 

a.[]=(0, "a")
=> "a"
```

Where ```0``` is the index you want to set and ```"a"``` is the value 
  
```
a
=> ["a", 2, 3, 4]
```
  
#### <<

You can also use the `<<` syntax for ```push```

```
a << 6
=> [1, 2, 3, 4, 5, 6]
  
# Which is the same as:
  
a.<<(7)
=> [1, 2, 3, 4, 5, 6, 7]
```

<br>

##We do: Predicate methods (?)

Ruby is slightly different than a few other languages, methods names can contain special characters.

#### Convention for method names

Method names should be in: 

- lower_snake_case
- start with a letter or undersocre
- can contain some special characters ?, !, [], =

More Ruby conventions can be found on the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).

#### ?

Ruby has a convention for method names that return a boolean.

```
# a still = [1, 2, 3, 4, 5, 6, 7]

a.any?
=> true
  
a.include?("a")
=> false
```

You don't **have** to name methods using this convention but think, if you expect the method to return a ```true``` or a ```false``` then add ? to the method name?

It reads like english!

<br>

##We do: Bang methods (!)

Another convention that Ruby has for naming methods is for bang methods, or dangerous methods where it uses an exclamation point (!):

Lets create another array

```
array = [[1,2,3,4],[4,5,6,7],[7,8,9,10]]
=> [[1,2,3,4],[4,5,6,7],[7,8,9,10]]
```
  
If we wanted to merge these three arrays into one array, we can use the method `flatten`

```
array.flatten
=> [1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 9, 10]
```
  
However, if we check the value of the variable ```array```

```
array
=> [[1, 2, 3, 4], [4, 5, 6, 7], [7, 8, 9, 10]]
```
  
If we want to run a method and change the value of the object we ran the method on...

```
array.flatten!
=> [1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 9, 10]
  
array
=> [1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 9, 10]
```

Another example:

```
array = [nil, 1, nil, 3, 1, nil]
array.compact
=> [1, 3, 1]
  
array
=> [nil, 1, nil, 3, 1, nil]
  
array.compact!
=> [1, 3, 1]
  
array
=> [1, 3, 1]
```

Not all methods have bang versions.

<br>

##We Do: Hash methods

Hash methods are very similar to array methods.

A couple of interesting ones are:

```
hash = {alex: "27", gerry: "27"}
=> {:alex=>"27", :gerry=>"27"}
  
hash.keys
=> [:alex, :gerry]
  
hash.values
=> ["27", "27"]
```

You can look up more methods by doing:

```
{}.methods.sort
=> [:!, :!=, :!~, :<=>, :==, :===, :=~, :[], :[]=, :__id__, :__send__, :all?, :any?, :assoc, :chunk, :class, :clear, :clone, :collect, :collect_concat, :compare_by_identity, :compare_by_identity?, :count, :cycle, :default, :default=, :default_proc, :default_proc=, :define_singleton_method, :delete, :delete_if, :detect, :display, :drop, :drop_while, :dup, :each, :each_cons, :each_entry, :each_key, :each_pair, :each_slice, :each_value, :each_with_index, :each_with_object, :empty?, :entries, :enum_for, :eql?, :equal?, :extend, :fetch, :find, :find_all, :find_index, :first, :flat_map, :flatten, :freeze, :frozen?, :grep, :group_by, :has_key?, :has_value?, :hash, :include?, :index, :inject, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :invert, :is_a?, :keep_if, :key, :key?, :keys, :kind_of?, :lazy, :length, :map, :max, :max_by, :member?, :merge, :merge!, :method, :methods, :min, :min_by, :minmax, :minmax_by, :nil?, :none?, :object_id, :one?, :partition, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :rassoc, :reduce, :rehash, :reject, :reject!, :remove_instance_variable, :replace, :respond_to?, :reverse_each, :select, :select!, :send, :shift, :singleton_class, :singleton_method, :singleton_methods, :size, :slice_before, :sort, :sort_by, :store, :taint, :tainted?, :take, :take_while, :tap, :to_a, :to_enum, :to_h, :to_hash, :to_s, :trust, :untaint, :untrust, :untrusted?, :update, :value?, :values, :values_at, :zip]
``` 

And looking on [hash docs](http://ruby-doc.org//core-2.2.0/Hash.html).

<br>

##We Do: What is a code block?

Ruby has another tool that allows you to run a chunk of code, called a code block. A block is sort of a method without a name.

```
$ irb
  
10.times { puts "hello" }
``` 

There are two ways of using a block in Ruby, using ```do/end``` and the ```{}``` syntax.

```
$ subl 
  
10.times { puts "hello" }

10.times do 
  puts "hello"
end
```
  
Usually we use ```do/end``` for multi-line block and ```{}``` for one-liners.

#### Passing object into code block

We use the `|` pipe characters to pass an object into the code block.

```
10.times do |n|
  puts "The number is #{n}."
end
```

Code blocks are perhaps one of the coolest features of Ruby!

<br>

##Closure

Every method call in Ruby has the following syntax:

- **A receiver object** or **variable** (defaults to `self` if absent)
- **A dot** (required if there is an explicit reciever)
- **A method name** (requrired)
- **An argument list** (optional)
- **A code block** (optional)


It's really important to remember that everything is an object in Ruby. That every object is an example of or an instance of a particular class.

We ask those objects to do things by sending them messages, (calling methods on them).

<br>
