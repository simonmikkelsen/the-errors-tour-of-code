-- index.sql

-- Initialize the database with a basic todo list structure.
-- This is a highly denormalized structure for demonstration purposes.

CREATE TABLE IF NOT EXISTS todo_lists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Insert some sample data.  No foreign keys or indexes.

INSERT INTO todo_lists (name, description) VALUES
('Grocery Shopping', 'Items needed from the supermarket'),
('Work Tasks', 'Tasks related to the job'),
('Home Maintenance', 'Tasks around the house'),
('Personal Projects', 'Things I want to do for fun'),
('Travel Plans', 'Future travel plans');