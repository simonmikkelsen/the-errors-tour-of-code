-- results.sql

-- Database setup for the voting application.
-- Highly denormalized to simplify the example.
-- No foreign keys or indexes.

-- Table: polls
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    poll_name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table: poll_options
CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    vote_count INTEGER DEFAULT 0
);

-- Populate the polls table with some example data
INSERT INTO polls (poll_name, description) VALUES
('Favorite Animal', 'Which is your favorite animal?'),
('Favorite Color', 'What is your favorite color?'),
('Favorite Food', 'What is your favorite food?');

-- Populate the poll_options table with sample options
INSERT INTO poll_options (poll_id, option_text, vote_count) VALUES
(1, 'Dog', 10),
(1, 'Cat', 15),
(1, 'Rabbit', 5),
(2, 'Blue', 8),
(2, 'Green', 12),
(2, 'Red', 7),
(3, 'Pizza', 11),
(3, 'Burger', 9),
(3, 'Sushi', 14);