-- index.sql

-- Creating the table 'polls'
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL
);

-- Inserting some sample data
INSERT INTO polls (question, option1, option2) VALUES
('Which animal is cutest?', 'Cat', 'Dog'),
('What\'s your favorite color?', 'Blue', 'Red'),
('Do you like ice cream?', 'Yes', 'No'),
('What is your name?', 'John', 'Jane');