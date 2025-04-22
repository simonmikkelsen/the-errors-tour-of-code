-- index.sql

-- This SQL script sets up the database for the voting application.
-- It is highly denormalized and lacks foreign keys and indexes for simplicity.

-- Create the polls table
CREATE TABLE polls (
    poll_id INT PRIMARY KEY AUTO_INCREMENT,
    question VARCHAR(255) NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL
);

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert some sample data
INSERT INTO users (username, password) VALUES
('admin', 'password123'),
('user1', 'secure_pass'),
('user2', 'another_pass');

INSERT INTO polls (question, option1, option2) VALUES
('What is your favorite color?', 'Blue', 'Red'),
('Do you like pizza?', 'Yes', 'No'),
('What is your favorite animal?', 'Dog', 'Cat');