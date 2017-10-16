DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;
-- 1. Create a new postgres user named `has_many_user`
CREATE USER has_many_user;
-- 1. Create a new database named `has_many_blogs` owned by `has_many_user`
CREATE DATABASE has_many_blogs OWNER has_many_user;
-- 1. Before each create table statement, add a drop table if exists statement.
\c has_many_blogs


-- 1. In `has_many_blogs.sql` Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the **has_many_blogs schema** below.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR (90),
  first_name VARCHAR (90) DEFAULT NULL,
  last_name VARCHAR (90) DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW ()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title VARCHAR (180) DEFAULT NULL,
  url VARCHAR (510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  users_id int REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  users_id int REFERENCES users(id),
  post_id int REFERENCES posts (id)
);

-- 1. Create the necessary FKs needed to relate the tables according to the **relationship table** below.

-- 1. Run the provided `scripts/blog_data.sql`