-- index.sql
-- This script sets up the database schema for the voting app.
-- It is highly denormalized for demonstration purposes.

-- Create the polls table
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    poll_name VARCHAR(255) NOT NULL,
    description TEXT,
    option1 VARCHAR(255),
    option2 VARCHAR(255),
    option3 VARCHAR(255),
    option4 VARCHAR(255)
);

-- Create the voters table
CREATE TABLE voters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Create the votes table
CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER REFERENCES polls(id),
    voter_id INTEGER REFERENCES voters(id),
    option_chosen VARCHAR(255)
);