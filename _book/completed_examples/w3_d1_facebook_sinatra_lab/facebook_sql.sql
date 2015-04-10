CREATE TABLE people
(
  id serial8 primary key,
  first varchar(20) not null,
  last varchar(20) not null,
  dob date check (dob < '1/1/2000'),
  relationship varchar(50),
  friends int2 default 0,
  city varchar (20)
);

INSERT INTO people (first, last) VALUES ('jim', 'jones');
INSERT INTO people (first, last) VALUES ('sue', 'smith');
INSERT INTO people (first, last, dob) VALUES ('jil', 'nance', '1/1/1987');