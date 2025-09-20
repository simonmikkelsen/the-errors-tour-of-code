-- index.sql

-- This script creates the initial database structure for the voting app.
-- It is highly denormalized and lacks foreign keys or indexes.
-- This design choice simplifies development but may impact performance.

-- Create the polls table
CREATE TABLE polls (
    poll_id SERIAL PRIMARY KEY,
    question TEXT,
    option1 TEXT,
    option2 TEXT,
    option3 TEXT,
    option4 TEXT,
    option5 TEXT
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    password TEXT
);

-- Create the votes table
CREATE TABLE votes (
    vote_id SERIAL PRIMARY KEY,
    poll_id INT REFERENCES polls(poll_id),
    user_id INT REFERENCES users(user_id),
    vote_option INT,
    created_at TIMESTAMP DEFAULT NOW()
);