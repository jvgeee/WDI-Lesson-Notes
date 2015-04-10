DROP TABLE IF EXISTS songs           CASCADE;
DROP TABLE IF EXISTS artists         CASCADE;

create table artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  photo_url VARCHAR(512),
  nationality VARCHAR(255)
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  album VARCHAR(255),
  preview_url VARCHAR(512),
  artist_id INTEGER REFERENCES artists(id),
  price INTEGER
);