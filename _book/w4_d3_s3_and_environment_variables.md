AWS S3 and Environment Variables
=====

## Opening: Intro to AWS

[i]:Ensure everyone has signed up to Amazon AWS

#### Signing up to AWS

- [Amazon WebServices](http://aws.amazon.com/s3/)
- Click "Create free account"

When you sign up to AWS, if you haven't already, you will need a credit card (or a debit card from a credit card company e.g. Visa Debit card).

Now we're signed up, we can get the credentials that our apps need in order to use AWS.

<br> 

## I Do: Introduction to the Cloud

AWS allows you to save files **in the cloud** instead of storing them locally.

After signing up to AWS, we will get **a secret code** that our app will have to use every time it talks to AWS.

#### What exactly is Amazon Web Services?

We have all undoubtedly heard of a little company called "Amazon".

Amazon sees huge peaks and troughs in traffic on their website, they **don't need all of their computing infrastructure all the time**, so they decided to rent this computing out to other developers. 

This is what "Amazon Web Services", or AWS. It is a service that lets us **rent computer infrastructure** from Amazon.  

This rented infrastructure is used by millions of companies now, and AWS has become one of Amazon's biggest business areas. (It's now estimated at about 20% of Amazon's value even though it only generates about 2.9% of it's revenue).

So the cloud is basically a lot of computers somewhere else that we can use.

<br>

## I Do: Tour of AWS

- Please login to [AWS](http://aws.amazon.com/)
- Navigate to AWS Management Console

In order to keep their services manageable, they broke their various computer systems up into seperate services that just do one thing really well. 

We're going to use just one of these services today: **S3 ("Scalable Storage Service").**

Let's take a quick tour of some of their other most useful services:

- **Scalable Storage Service (S3)** - a huge folder for storing your files in
- **Elastic Compute Cloud (EC2)** - computers for running your website on
- **Mechanical Turk** - an API for distributing work to real people

<br> 

## We Do: Signup to S3

Let's sign-up to use S3:

- Go to **"Services"** menu item and select "**All AWS Services**" (this shows all the services we can use).
- Select **"S3"**
- Follow the instructions to enable our account to use S3
- Back in the AWS console, click on "S3" again
- We are now taken to a view that lets us manage our own personal S3 storage

#### Why do we use S3?

But why use S3 at all? 

- **Multi-server sites** - copying images to each server's public folder is difficult... and stupid
- **Security** - letting users save files on our own web server is dangerous
- **Storage limitations** - our web server probably won't have much storage space
- **Speed** up the delivery of the images

<br>

##We Do: Create an access key

- Go to top right: 

```
"Username" > "security credentials"
"account/console" > "security credentials"
```

- Read the message (we won't bother with "2 factor auth" right now)
- Expand the **Access Keys** section
- Click on the **"Create new access key"** button
- Show the access key and **copy the Secret Access Key**
- Download the key file, and keep it somewhere safe

*DO NOT PUT THIS FILE IN YOUR CLASS WORK FOLDER OR ANY OTHER FOLDER YOU SHARE WITH OTHERS*

Suggestion: create a ".aws" directory in your home folder and put it in there.

```
cd ~
ls -A
mkdir .aws
mv ~/Downloads/rootkey.csv ~/.aws/
```

Ensure you have copied the secret key details.

<br> 

## We Do: Add ENV variables to ~/.zshrc

Open your .zshrc file: 

```
subl ~/.zshrc
```

Write the following:

```
export AWS_ACCESS_KEY_ID=AK9999999999999999999
export AWS_SECRET_ACCESS_KEY=p9pkzBevqrererereiu99sdfsadf99999
```

This can be anywhere in the file, but usually they are grouped together.

What has this done? Let's go through it!

<br>

## We Do: What is an ENV variable

#### Security

If we want to share our source code (e.g. on Github)? How can we do so without also sharing the secret credentials that our app relies on to connect to AWS?

The answer is something called **"environment variables"**, which provide a means of keeping secret things out of our code.

#### Shell variables vs Environment variables

Before we look at environment variables, let's remind ourselves about plain old shell variables. 

Just like we can create local variables in a **pry/irb** session, we can also create variables in a regular shell session:

```
$ my_var=99
```

To display the value of a variable, we use echo:

```
$ echo $my_var
99
```

**Note**: that we prefix the variable name with a dollar symbol when we want to recall them.

Environment variables are very similar to regular variables, but we create them using "export":

```
$ export MY_ENV_VAR=100
$ echo $MY_ENV_VAR
100
```

The difference between regular shell variables and environment variables is that whenever we launch a new program from the shell (e.g. our ruby program), the program will be able to access (it will inherit) all the environment variables from the shell.

#### Open a new shell tab

Create a new shell tab (cmd+t) and try to get echo out this $MY_ENV_VAR

```
$ echo $MY_ENV_VAR
```

Nothing. This is because the value was only set for that shell session. 

#### Shell config file, .zshrc

We don't want to manually create these environment variables every time we launch our app, and so we can add the "export" commands to our shell's config file. 

That way, every new shell we launch will have these credentials available as environment variables.

#### Display all ENV variables

We can see all the current environment variables by simply typing "env" or "ENV" in the shell:

```
$ env
TERM_PROGRAM=Apple_Terminal
SHELL=/bin/zsh
USER=jon
PATH=/Users/jon/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/libexec
LANG=en_GB.UTF-8
HOME=/Users/jon
LOGNAME=jon
AWS_ACCESS_KEY_ID=AK9999999999999999999
AWS_SECRET_ACCESS_KEY=p9pkzBevqrererereiu99sdfsadf99999
```

As we can see, there are lots of environment variables already defined. 

Any program we launch will have access to all of these and so our programs can find out all sorts of interesting things about the environment it is running in e.g.:

- **USER** - the current user's name
- **HOME** - the user's home folder
- **LANG** - the language (and character encoding) the user is using
- **PATH** - a list of places to look for programs we try and run

#### Can you see the AWS key?

**Note**: We also have access to the "AWS_ACCESS_KEY_ID" environment variables too!

<br>

## We Do: Access ENV variables in irb

We can verify that these variables are accessible to our programs by launching one. For instance, irb is a Ruby program. 

So let's launch irb and take a look...

The ruby ENV object is a hash-like object that gives us access to the environment variables that ruby has inherited from the shell it was launched in.

```
$ irb
=> ENV
{"HOME"=>"/Users/jon",
"LANG"=>"en_GB.UTF-8",
"LOGNAME"=>"jon",
"MY_ENV_VAR"=>"100",
"PATH"=>
"/Users/jon/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/jon/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/libexec",
"SHELL"=>"/bin/zsh",
"USER"=>"jon",
"AWS_ACCESS_KEY_ID" => AK9999999999999999999,
"AWS_SECRET_ACCESS_KEY" => p9pkzBevqrererereiu99sdfsadf99999}
```

To access one, we use normal syntax:

```
=> ENV['AWS_ACCESS_KEY_ID']
"AK9999999999999999999"
```

We can see that it is possible to pass information to our ruby programs using environment variables. We now have a way to pass our secret credentials into our program at runtime, rather than hard-coding them into our source code.

#### Sharing apps

This does mean that if you are working on an app that uses an environment variable - you will have to create one for yourself. It will be different to other people's. 

*DONT SHARE YOUR ENV VARIABLES WITH OTHER PEOPLE! COUGH, JODY.*

<br>

## We Do: Buckets in S3

We can think of S3 as a big bucket in the cloud, where you can dump all our files. Conveniently, AWS actually uses the term **"bucket"** too.

You can create as many buckets as you like, but they **must have a globally unique name**, i.e. if any other S3 user has already used a bucket name, you won't be allowed to use that name.

#### Create your first bucket

- Create a bucket now 
- Call it "wdi4-something" e.g. "wdi4-ac-lesson-test" is the one I've created. 
- When asked what region, **select "Ireland"**. Generally speaking, things will be faster if you choose a region closer to your users.
- Choose **Create**

Click on your bucket, and you'll see that it is currently empty. 

#### Bucket interface

You can use the online interface to create a folder within your bucket e.g. "foo". You can also use the interface to delete it again. 

**Notes:**

- Right click works in this interface
- Folders can have any name you want, it is only the bucket that must have a unique name

#### Add bucket name as env var

To do so, we can add the following to .zshrc:

```
export WDI_S3_BUCKET=wdi4-ac-lesson-test
```

#### Source .zshrc

We need to create a new terminal window or run **$ source .zshrc** in order for those new settings to take effect. Verify that they are available in terminal before continuing.

Check that the new env variable has been saved by typing:

```
$ env
```

<br>

##Closure

#### Heroku and environment variables

We'll be using Heroku to deploy our apps. We can't edit our shell profile on Heroku, but they do provide us with a way to set environment variables, and the principle is the same.

#### Delete your buckets!

If we forget to get rid of the content of the bucket, we actually will keep paying for it. Think of emptying it once you're done with it! 

<br>
