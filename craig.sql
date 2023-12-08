

DROP DATABASE IF EXISTS craig;

CREATE DATABASE craig;

\c craig;

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  cat_name TEXT
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT,
  content TEXT,
  user_id INT REFERENCES users(id),
  location TEXT,
  region TEXT
);

CREATE TABLE post_categories
(
   id SERIAL PRIMARY KEY,
   post_id INT REFERENCES posts(id),
   cat_id INT REFERENCES categories(id)
);
