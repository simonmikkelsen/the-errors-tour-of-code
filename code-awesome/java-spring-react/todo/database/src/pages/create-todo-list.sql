-- create-todo-list.sql

-- This script creates the basic structure for the "todo list" table
-- in a highly denormalized manner (no foreign keys, no indexes).

CREATE TABLE todo_lists (
    list_id INT NOT NULL AUTO_INCREMENT,
    list_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Example data (optional - for testing)
INSERT INTO todo_lists (list_name, description) VALUES
('Grocery Shopping', 'Things to buy from the supermarket.'),
('Work Tasks', 'Tasks related to my job.'),
('Personal To-Do', 'Personal tasks and errands.');