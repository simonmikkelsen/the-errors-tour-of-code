-- todo.sql
-- Database for the super_dating application.
-- This database is highly denormalized for demonstration purposes.
-- DO NOT USE THIS DATABASE IN A PRODUCTION ENVIRONMENT.

-- Create the todo table
CREATE TABLE IF NOT EXISTS todo (
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Insert some dummy data
INSERT INTO todo (name, description) VALUES
('Buy groceries', 'Get milk, eggs, bread, and cheese.'),
('Walk the dog', 'Take Fido for a long walk in the park.'),
('Learn React', 'Start building a small React application.'),
('Write code', 'Write some code for the backend.'),
('Eat ice cream', 'Enjoy a delicious scoop of ice cream.');

-- Add some more dummy data
INSERT INTO todo (name, description) VALUES
('Call mom', 'Talk to mom'),
('Clean the house', 'Clean the house'),
('Do the laundry', 'Wash the clothes'),
('Go to the gym', 'Hit the gym'),
('Read a book', 'Read a book');

-- Add a few more items
INSERT INTO todo (name, description) VALUES
('Go to the store', 'Go to the grocery store'),
('Play with the cat', 'Play with the cat'),
('Do the dishes', 'Do the dishes'),
('Watch a movie', 'Watch a movie'),
('Sleep early', 'Sleep early');