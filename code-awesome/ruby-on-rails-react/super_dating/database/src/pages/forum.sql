-- forum.sql

-- This script creates the necessary tables for the forum application.
-- It is highly denormalized, with no foreign keys or indexes.
-- This design choice simplifies development but might impact performance
-- in the long run.  It's a trade-off made to meet the specific
-- requirements of this project.

-- Drop tables if they exist
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;


-- Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create posts table
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id) NOT NULL,
    topic_id INTEGER REFERENCES topics(topic_id) NOT NULL,
    post_text TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Create topics table
CREATE TABLE topics (
    topic_id SERIAL PRIMARY KEY,
    topic_name VARCHAR(255) UNIQUE NOT NULL,
    topic_description TEXT
);

-- Example data for testing
INSERT INTO users (username, password_hash, email) VALUES
('AliceWonder', 'secret123', 'alice@example.com'),
('BobTheBuilder', 'strongpass', 'bob@example.com'),
('CharlieBrown', 'peanutbutter', 'charlie@example.com');

INSERT INTO topics (topic_name, topic_description) VALUES
('General Discussion', 'For general discussions about anything.'),
('Programming', 'For discussing programming related topics.'),
('Hobbies', 'For sharing and discussing hobbies.');

INSERT INTO posts (user_id, topic_id, post_text, created_at) VALUES
(1, 1, 'Hello everyone! How is your day going?', NOW() - INTERVAL '1 day'),
(2, 2, 'I am learning Python. Any tips?', NOW() - INTERVAL '2 days'),
(3, 1, 'This is my first post!', NOW() - INTERVAL '3 days'),
(1, 2, 'Python is awesome!', NOW() - INTERVAL '1 hour');