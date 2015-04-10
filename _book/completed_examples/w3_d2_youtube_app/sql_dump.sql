drop table videos;

create table videos
(
  id serial8 primary key,
  title varchar(255),
  description text,
  url text,
  genre varchar(255)
);


-- Music
INSERT INTO videos (title, description, genre, url)
  VALUES ('Do What You Want', 'Official video', 'poprock', 'i00GDT9FuFM');

INSERT INTO videos (title, description, genre, url)
  VALUES ('End Love', 'Official video', 'poprock', 'V2fpgpanZAw');
