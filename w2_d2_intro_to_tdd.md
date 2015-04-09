

Intro to TDD
=====

## What is testing?

Testing is the process of making sure your code does what it's supposed to do.

Manual testing is just that - checking all the code works as expected after you change something. But this is limited by the time you need to test *everything* whenever you change *anything*. The bigger the code base gets the harder it is to check every line works every time a change is made.

Automatic testing is achieved by writing code that checks your code. This may involve writing some code which plays through scenarios that address various possible input values into your code, and what the expected outcome is.

When you write very small tests that check very small parts of classes, we'd call that "unit" testing.

As your code base grows, so does you test coverage. You should get to a situation where you can run the tests at any time, and every single line of your code gets passed through to ensure it's still returning what you expected it to when it was first written.

Problems with testing after developing:

  - Do you get to make the time?
  - Will your PM let you... ?
    - ...or make you get onto the next bit of functionality...

## What is TDD? 



In test-driven development, also called red/green development, you write the tests first, before writing any code, and then write code which makes the test pass.

The test will initially fail - that's the point of the 'red' - and the expectations of the test will drive how you will write your actual code, called your implementation, until the test passes (goes 'green').

Frequently, TDD uses pair programming - two developers working together at one machine. Often, one person writes a test; then the other writes the implementation (and they alternate through the day). In an interview, you might be given some test code and be asked to write the implementation code, or you might be asked to write the tests for some outline functionality to demostrate your familiarity with this process.

The process is also referred to as red/green/refactor, because once the test passes (it's "green"), you can review the code you've written, and any other parts of the code it effects to see if they can be cleaned up at all. No new functionality is added at this stage - the outcome is for the tests to pass exactly as they just have, but with some measure of 'better' code.


![TDD LIfecycle](http://www.pathfindersolns.com/wp-content/uploads/2012/05/red-green-refactorFINAL2.png)

## Let's write our first test

We're going to build a bank account application using TDD. The functionality of our app will include:

- creating a bank
- adding accounts to the bank
- depositing into an account
- withdrawing money from an account


Create a bank_account directory. Create a spec directory in it. Then install rspec.

```
  gem install rspec -v 2.14
  mkdir bank_app
  cd bank_app
```    

Go create a blank file called spec_helper.rb in the spec directory.

```
  touch spec/spec_helper.rb

  subl .
```

In the spec_helper.rb file paste the following:

```
  RSpec.configure do |config|
    config.color_enabled = true
    config.tty = true
    config.formatter = :documentation
  end
```

What kind of models (classes) do you need for this app? 

Maybe we should start with a Bank. Create a bank.rb file.

```
  touch bank.rb
```

There's nothing in this file at the moment. Let's write a test for our bank. To test a file, create a test within /spec called bank_spec.rb.

```
  touch spec/bank_spec.rb
```

Any spec file needs to have access to your spec_helper file, so you need to require it. Because it's a file in the same directory, use require_relative. You also need to include the file that is being tested. Notice that the file name is preceded by ../. This means that it is accessing the directory above the one you are currently in.

```
  require_relative 'spec_helper'
  require_relative '../bank'
```

Now try to run the test. Use rspec spec.

```
  rspec spec

  No examples found.

  Finished in 0.00005 seconds
  0 examples, 0 failures
```

#### General structure of a project with rspec testing

RSpec is a DSL (domain-specific language). This means that it is written specifically for use with Ruby, but is not Ruby.

What are we testing? We want to create a bank. What method would this use? `.new`.

A `describe` at the top of the test is for the class, then another `describe` is for the method being tested, then the `it` line is the test.

```
  describe Bank do
    describe ".new" do
      it "creates a Bank object" do
      end
    end
  end
```

Run the test. We get an error. This is good!

```
  rspec spec
  .../bank_app/spec/bank_spec.rb:4:in `<top (required)>': uninitialized constant Bank (NameError)...
```

Go into the bank.rb file and write some implementation code until the error goes away. The solution is to create a class called Bank.

```
  class Bank
  end
```

What are parameters we will want to include when creating a bank object? A name. Now we can write some more test code within the existing block

```
  ...
    it "creates a Bank object" do
      bank = Bank.new('TD Bank')
      expect(bank).to_not eq nil
  ...
```



Run the test again, and it fails with:

```
  ArgumentError:
  wrong number of arguments(1 for 0)
  # ./spec/bank_spec.rb:7:in `initialize'
  # ./spec/bank_spec.rb:7:in `new'
  # ./spec/bank_spec.rb:7:in `block (3 levels) in <top (required)>'
```

This tells you exactly which test was being run when it broke, and which line of the test file. The colour-coding helps identify failed tests too. 

Fix the problem. Only write the minimum amount of code needed to meet the requirements.

```
  def initialize(name)
  end
```

Let's create another test. This tests the name method and expects it to return the name 'TD Bank'.

```
  describe "#name" do
    it "has a name" do
      bank = Bank.new('TD Bank')
      expect(bank.name).to eq 'TD Bank'
    end
  end
```

Remember, there are class methods, like `Person.new`, and instance methods, like `.name`. When you write tests, the naming convention is to use `.class_method` and `#instance_method` in the description.

Now fix the "undefined method 'name'" error so the bank name test passes.
To make the test pass, you could define your own `name` method, but you can also use `attr_accessor :name`, which creates a getter and setter for you.

```
  class Bank
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end
```

This passes the test. 

While doing this, notice that there is repeated code which creates a bank object in all of our tests. Let's DRY this code.

```
  let(:bank) {Bank.new('TD Bank')}
```

Run the test to see if this refactoring of the test works. That's one way we refactor... in our tests or our implementations... after every cycle of writing tests.


## Tell the instructor what to write

Now let's add a test for creating a bank account with a name and an initial deposit.

```
  describe "#create_account" do
    it "create an account" do
      bank.create_account('Bob', 200)
      expect(bank.accounts['Bob']).to eql 200
    end
  end
```

Now write the code to make this test pass. Create a `create_account` method that takes a name and an initial deposit. Look at the error message to see what needs to be done.

```
  1) Bank#create_account create an account
     Failure/Error: bank.create_account('Bob', 200)
     NoMethodError:
       undefined method `create_account' for #<Bank:0x007fdd4b814270 @name="TD Bank">
```

Create a `create_account` method.

```
    def create_account(account, deposit)
    end
```

Now the error is about a missing `accounts` method. What is accounts? We know it is a hash because the the brackets in the test. We can fix this, but we need to add an accounts hash, and presumably when we instanciate a Bank, the hash should be initialized and empty - so this needs another test.

```
  describe '.new' do
    it "creates a Bank object" do
      expect(bank).to_not eq nil
    end
    it "has no accounts" do
      expect(bank.accounts.count).to eq 0
    end
  end
```

Which causes there to be now two failing tests - but they both complain about the missing `accounts` method.

```
  attr_accessor :name
  attr_reader :accounts

  def initialize(name)
    @name = name
    @accounts = {}
  end
```

And then fix the new failure by writing the some code to pass the test. 

```
  def create_account(account, deposit)
    accounts[account] = deposit
  end
```

Now we'll write a test to handle a deposit into an account.

```
  describe "#deposit" do
    it "deposits money from client into account" do
      bank.create_account('Bob', 200)
      bank.deposit('Bob', 300)
      expect(bank.accounts['Bob']).to eq 500
    end
  end
```

Now write some code to define the deposit method.

```
  def deposit(account, amount)
    accounts[account] = accounts[account] + amount
  end
```

This works, so refactor: 

```
  def deposit(account, amount)
    accounts[account] += amount
  end
```

Let's add a feature to check the balance on an account. Start with the test.

```
  describe "#balance" do
    it "returns the balance for the client" do
      bank.create_account('Bob', 200)
      expect(bank.balance('Bob')).to eq 200
    end
  end
```

And write the code.

```
  def balance(account)
    accounts[account]
  end
```

Now add a test for a withdrawal.

```
  describe "#withdraw" do
    it "subtracts money from the account" do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 50)
      expect(bank.balance('Bob')).to eq 150
    end
  end
```

And write the code to pass the test.

```
  def withdraw(account, amount)
    accounts[account] -= amount
  end
```


Congratulations! You just created an app with lots of features using TDD!


#### caveats, Is the test always right? 

Humans write the tests too, so this is not infallible.

What situations can we anticipate that would make our code misbehave?

- what happens if you try to withdraw more than is in an account?
- what happens if you try to deposit money into a non-existent account?
- or if you try to withdraw from a non-existent account?


Add one more test to ignore withdrawals that are greater than the account balance.

```
  describe "#withdraw" do
  ...
    it "ignores requests for withdrawals greater than account balance" do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 5000)
      expect(bank.balance('Bob')).to eq 200
    end
  end
```

And write the code to pass the test. 

```
  def withdraw(account, amount)
    accounts[account] -= amount if amount <= accounts[account]
  end
```







