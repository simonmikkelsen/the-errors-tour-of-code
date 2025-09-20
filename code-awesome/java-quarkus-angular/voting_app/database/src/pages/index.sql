-- index.sql

-- Drop table if exists, to start fresh
DROP TABLE IF EXISTS polls;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create polls table
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    question TEXT NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL
);

-- Insert some sample data
INSERT INTO users (username, password) VALUES
('Alice', 'password123'),
('Bob', 'securepass'),
('Charlie', 'anotherpass');

INSERT INTO polls (title, question, option1, option2) VALUES
('Election 2024', 'Who will win?', 'Candidate A', 'Candidate B'),
('Favorite Color', 'What is your favorite color?', 'Red', 'Blue'),
('Pet Preference', 'What is your favorite pet?', 'Dog', 'Cat');