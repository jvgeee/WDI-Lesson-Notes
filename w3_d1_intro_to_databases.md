
Intro to databases
=====


##Opening: What is a database?

A database is a collection of information that is organized so that it can easily be accessed, managed, and updated. In one view, databases can be classified according to types of content: bibliographic, full-text, numeric, and images.

- Types of databases
  - SQL / NoSQL
  - Relational / Document
  - Note that a 'relation' is a view of data that comes back from a query, not the fact that there are relationships
- What do we store in databases



- How do we manipulate data in databases?
  - Create
  - Read
  - Update
  - Delete



PostgreSQL is the world’s most advanced open source database. Developed over 25 years by a vibrant and independent open source community, PostgreSQL was born from the same research as Oracle and DB2 and contains comparable enterprise class features such as full ACID compliance for outstanding transaction reliability and Multi-Version Concurrency Control for supporting high concurrent loads.


##We Do: PostgreSQL

```
  which psql
```

If there are any issues with running `psql`, ensure that the `postgresapp` is installed and running (it should have been configured in installfest), and that the path is updated to include it.

```
  psql
  \q  -- to quit
```

Psql is to postgresql what irb is for ruby.

Once you are in psql, to see the list of all the psql meta-commands, type

```
  \?
```

if you want to see all the sql commands, type:
```
  \h
```

##We do: How to create a table and read/write data.

To work with data in databases we perform the four CRUD operations.
So we'll work through the SQL commands that give us that functionality.



In psql:

```
  create database people_app;
  \l 
  \c people_app
  \d
  create table people (
    name varchar(255),
    age int2,
    sex char(1)
    );
  \d
  \d people

  INSERT INTO PEOPLE (name) VALUES ('bob');

  SELECT * FROM PEOPLE;
  INSERT INTO people (age) VALUES (35);

  INSERT INTO people (name, age) VALUES ('jill', 22);
  SELECT * FROM PEOPLE;

  INSERT INTO people (sex, name, age) VALUES ('f', 'sue', 22);
  SELECT * FROM PEOPLE;

  # error values
  INSERT INTO people (sex, name, age) VALUES ('f', 'sue', 'fsd');
  INSERT INTO people (sex, name, age) VALUES ('ff', 'sue', 31);

  UPDATE people SET sex = 'f' WHERE name = 'jill';
  SELECT * FROM PEOPLE;

  INSERT INTO people (name, age) VALUES ('jill', 29);
  SELECT * FROM PEOPLE;

  UPDATE people SET age = 23 WHERE name = 'jill' and age = 22;
  SELECT * FROM PEOPLE;

  UPDATE people SET name = 'sam', sex = 'm' WHERE age = 35;
  SELECT * FROM PEOPLE;

  # be careful with delete... there's no undo!
  DELETE FROM people WHERE name = 'bob';
  SELECT * FROM PEOPLE;
```


THis way we cn stor 

What's an ID column for?

```
  CREATE TABLE weathers (
    id serial8,
    city varchar(255),
    low int,
    high int,
    high_recorded_on date,
    low_recorded_on date
    );
```

int8 can store up to 18 million trillion

Now that the table has been created, we can insert data.

```
  INSERT INTO weathers (city, low, high, high_recorded_on) VALUES ('London', -10, 43, '1 Jan 2012')
```

Repeat the INSERT a couple of times - see the incrementing index

```
  SELECT * FROM weathers;
```

  

##We do: Link tables with Foreign Keys

Let's create a DB to track students and their courses.

  - we need a students table - what columns?
  - and a class table - what data?
  - how do we link the together to track all the courses a student's enrolled on?
    - Join table with two foreign keys

```
  DROP DATABASE people_app;

  CREATE DATABASE campus;
```

In the terminal

```
  mkdir campus
  cd campus
  touch campus.sql
  subl .
```

```
  CREATE TABLE students
  (
    id serial4 primary key,
    first varchar(20),
    last varchar(20),
    dob date,
    gpa float4
  );

  CREATE TABLE classes
  (
    id serial4 primary key,
    name varchar(50) unique not null
  );

  CREATE TABLE schedules
  (
    id serial4 primary key,
    student_id int4 references students(id),
    class_id int4 references classes(id)
  );
```

The fields in the join-table are generally named according to the convention "table_name_singular_id".

```
  psql -d campus -f campus.sql
  psql campus

  \d

  INSERT INTO students (first, last, dob, gpa) VALUES ('bill', 'jones', '1 Jan 1990', 3.1);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sally', 'jones', '1 Jan 1950', 3.6);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sue', 'smith', '1 Jan 2013', 2.6);
  SELECT * FROM students;

  INSERT INTO classes (name) VALUES ('Biology');
  INSERT INTO classes (name) VALUES ('Chemistry');
  INSERT INTO classes (name) VALUES ('Physics');
  SELECT * FROM classes;

  INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 1);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 2);
  SELECT * FROM schedules;
```

What if we add a student to a class that doesn't exist:

```
  INSERT INTO schedules (student_id, class_id) VALUES (2, 50);
```

Add some extra students

```
  INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 1);
```

How do you find out the names of the students taking Biology (class_id 1)?

```
  -- Start by getting just the information for the Biology class.
  SELECT * FROM schedules WHERE class_id = 1;

  -- We don’t really need the class_id, so we can just ask for student_id.
  SELECT student_id FROM schedules WHERE class_id = 1;

  -- Now we can get the student names from the student_ids. Note that (2,3) is kind of like an array.
  SELECT first, last FROM students WHERE id IN (2,3);
```

## We do: Joins


We can access some data by linking tables using foreign keys :


```

SELECT * FROM schedules JOIN classes ON schedules.class_id = classes.id WHERE classes.name = 'Biology';
```
```
SELECT * FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology';
```
```
SELECT students.* FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology';
```
```
SELECT DISTINCT students.id FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology';
```
```
SELECT DISTINCT students.id, students.first FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology';
```
```
SELECT * FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology';
```
```
SELECT students.* FROM schedules JOIN classes ON schedules.class_id = classes.id JOIN students ON students.id=schedules.student_id WHERE classes.name = 'Biology' GROUP BY students.id;

```
