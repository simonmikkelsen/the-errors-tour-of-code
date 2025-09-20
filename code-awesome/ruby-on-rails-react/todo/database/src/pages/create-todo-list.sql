-- create-todo-list.sql

-- This script creates the database tables and
-- sets up the database for the todo list application.
-- It's highly denormalized and lacks foreign keys or indexes
-- for demonstration purposes.

-- Create the todo_lists table
CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the todos table
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    description VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    order_number INTEGER NOT NULL,
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);

-- Example data (optional)
INSERT INTO todo_lists (title, description) VALUES
('Grocery Shopping', 'Items to buy from the supermarket.'),
('Work Tasks', 'Tasks to complete at the office.'),
('Home Chores', 'Tasks around the house.');

INSERT INTO todos (todo_list_id, description, completed, order_number) VALUES
(1, 'Milk', FALSE, 1),
(1, 'Eggs', FALSE, 2),
(1, 'Bread', FALSE, 3),
(2, 'Send Email', FALSE, 1),
(2, 'Prepare Presentation', FALSE, 2),
(3, 'Wash Dishes', FALSE, 1),
(3, 'Clean Bathroom', FALSE, 2);