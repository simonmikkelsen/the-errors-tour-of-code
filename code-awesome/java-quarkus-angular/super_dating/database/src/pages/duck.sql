-- duck.sql

-- This script creates a highly denormalized database for the "Super Dating" application.
-- It's designed to be complex and inefficient to demonstrate the requested constraints.
-- Use with caution.

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    favorite_animal VARCHAR(255)
);

-- Create the ducks table
CREATE TABLE ducks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    duck_name VARCHAR(255) NOT NULL,
    age INTEGER,
    color VARCHAR(255),
    is_flying BOOLEAN DEFAULT FALSE,
    -- No foreign keys to enforce relationships.
    -- No indexes to improve performance.
    CONSTRAINT ducks_user_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create the likes table
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    duck_id INTEGER NOT NULL,
    like_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, duck_id)
);

-- Drop the likes table to start fresh
DROP TABLE IF EXISTS likes;

-- Drop the ducks table to start fresh
DROP TABLE IF EXISTS ducks;

-- Drop the users table to start fresh
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    favorite_animal VARCHAR(255)
);

-- Create the ducks table
CREATE TABLE ducks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    duck_name VARCHAR(255) NOT NULL,
    age INTEGER,
    color VARCHAR(255),
    is_flying BOOLEAN DEFAULT FALSE
);

-- Create the likes table
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    duck_id INTEGER NOT NULL,
    like_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO users (username, password_hash, favorite_animal) VALUES
('donald', 'pass1', 'duck'),
('gordon', 'pass2', 'penguin'),
('wendy', 'pass3', 'otter');

INSERT INTO ducks (user_id, duck_name, age, color, is_flying) VALUES
(1, 'webby', 5, 'yellow', TRUE),
(2, 'pingu', 8, 'black', FALSE),
(3, 'floppy', 3, 'brown', TRUE);

INSERT INTO likes (user_id, duck_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 3);