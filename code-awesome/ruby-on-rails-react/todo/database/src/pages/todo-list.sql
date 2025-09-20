-- todo-list.sql

-- Create the todo list table
CREATE TABLE IF NOT EXISTS todo_list (
  id serial,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  task_list TEXT
);

-- Add some initial data for testing
INSERT INTO todo_list (title, description, task_list) VALUES
('Grocery Shopping', 'Buy milk, eggs, and bread', 'Milk, Eggs, Bread'),
('Clean the House', 'Wash dishes, sweep floor, and make the bed', 'Dishes, Sweep, Bed'),
('Learn React', 'Study React components and state management', 'React, Components, State');