DROP DATABASE IF EXISTS bearpress_db;

CREATE DATABASE bearpress_db;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    display_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pass_hash VARCHAR(60) NOT NULL,
    salt VARCHAR(50) NOT NULL
);

CREATE TABLE posts (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    author_id INTEGER NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    author_id INTEGER NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    on_post INTEGER NOT NULL REFERENCES posts(id)
);