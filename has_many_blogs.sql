DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users
(
  id serial,
  PRIMARY KEY (id),
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE posts
(
  id serial,
  PRIMARY KEY (id),
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()

);

CREATE TABLE comments
(
  id serial,
  PRIMARY KEY (id),
  body character varying(510) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()

);