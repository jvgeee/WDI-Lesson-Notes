MVC Sinatra (Active Record)
=====

## Opening

We have used Sinatra to create simple applications. However, we can apply the design pattern of MVC to make more complex applications.

<br>

## I Do: What is a model?

When we designed classes, we said we were 'modelling' them. Essentially, thats what models are. They allow us to deal with objects in our code. 

<br>

## I Do: Intro to ORM

ORM stands for:

- **O**bject
- **R**elational 
- **M**apping

ORM is a technique that connects the rich objects of an application to tables in a relational database management system. 

E.g. (Draw on board)

```
A user object in application ----> Users table in the db
```

#### ORM generates SQL

Using ORM, the properties and relationships of the objects in an application can be easily stored and retrieved from a database without writing SQL statements directly and with less overall database access code.

<br>

## I Do: Intro Active Record

Active Record, as an ORM Framework, gives us several mechanisms, the most important being the ability to:

- Represent models and their data.
- Represent associations between these models.
- Represent inheritance hierarchies through related models.
- Validate models before they get persisted to the database.
- Perform database operations in an object-oriented fashion.

Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. 

<br>

## We Do: Look at the starter code

Send across the starter code. 

#### Controllers

There is a controller file in the controllers directory with 7 actions:

These are just exactly the sames is if they were written in the main.rb file.

Take a look at some of the controller actions:

```
get '/artists' do
  @artists = Artist.all
  erb(:"artists/index")
end
```

We can see that ActiveRecord lets us write things like:

```
Artist.all
Artist.create(params[:artist])
Artist.find(params[:id])
```

This will generate SQL code for us!

#### Models

Have a look at the code in the artist model:

```
class Artist < ActiveRecord::Base
end
```

This is the same as a normal Ruby class except it inherits from ActiveRecord::Base.

<br>

## We Do: Create a database in postgresql

We need a database to connect to:

```
$ createdb tunr_db
$ psql -d tunr_db -f db/schema.sql
```

#### Launch app

Run the code with:

```
$ ruby app.rb
```

And view from ```http://localhost:4567```.

<br> 

## We Do: Adding Active Record to Sinatra

As you can seem We can use 'ActiveRecord' to connect to the database.

First, we need to require active record:

```
require 'activerecord'
```

This will allow use access to the ActiveRecord's methods.
Then in the main sinatra file:

```
 # Load Active Record and connect to the DB
ActiveRecord::Base.establish_connection({
  database: 'tunr_db',
  adapter: 'postgresql'
})

b# Fix an issue with sinatra and Active Record where connections are left open
after do
  ActiveRecord::Base.connection.close
end
```

This enables ActiveRecord to connect to the database.
  
<br>

## Assess

Your task is to add songs to this app. A song should have:

- id SERIAL PRIMARY KEY,
- title VARCHAR(255),
- album VARCHAR(255),
- preview_url VARCHAR(512),
- artist_id INTEGER REFERENCES artists(id),
- price INTEGER

The songs should have already been created by the sql file.

<br>

##Closure

Summary and presentation of the solutions.

<br>
