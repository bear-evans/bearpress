DROP DATABASE IF EXISTS bearpress_db;

CREATE DATABASE bearpress_db;

USE bearpress_db;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL
);

CREATE TABLE posts (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    author_id INTEGER NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    createdAt DATE NOT NULL,
    updatedAt DATE NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    author_id INTEGER NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    on_post INTEGER NOT NULL REFERENCES posts(id),
    createdAt DATE NOT NULL,
    updatedAt DATE NOT NULL
);