-- database-layer.sql
-- This file defines the database layer for the voting app.
-- It includes the schema, data insertion, and basic queries.

-- Drop existing tables (for clean reset)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS votes;

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    content TEXT NOT NULL
);

-- Create votes table
CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    user_id INTEGER REFERENCES users(id),
    UNIQUE (post_id, user_id)
);

-- Insert some sample data
INSERT INTO users (username, password) VALUES
('Alice', 'password123'),
('Bob', 'securepass'),
('Charlie', 'anotherpass');

INSERT INTO posts (user_id, content) VALUES
(1, 'This is my first post.'),
(2, 'Coding is fun!'),
(3, 'What do you think?');

INSERT INTO votes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 2);