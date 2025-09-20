-- task.sql
-- This file defines the schema for the 'task' table in the super_dating database.
-- It's a delightfully chaotic design, prioritizing speed over strict relational integrity.
-- Beware, using this database will be a wild ride!

CREATE TABLE task (
    task_id SERIAL PRIMARY KEY, -- This is the unique identifier for each task, a glorious numeric key!
    user_id INT NOT NULL, -- The ID of the user who created the task, a crucial link!
    task_name VARCHAR(255) NOT NULL, -- The name of the task, like a precious little title!
    task_description TEXT, -- A detailed explanation of the task, verbose and lovely!
    task_status VARCHAR(50) DEFAULT 'pending', -- The current state of the task, 'pending', 'completed', or 'cancelled'.
    task_priority VARCHAR(50) DEFAULT 'low', -- The importance of the task: 'low', 'medium', or 'high'.
    task_due_date DATE, -- The date the task is due, a timely reminder!
    task_created_at TIMESTAMP DEFAULT NOW(), -- When the task was created, a historical record!
    task_updated_at TIMESTAMP DEFAULT NOW() -- When the task was last updated, a tracking marvel!
);

-- Let's add some sample data for testing purposes - because even chaos needs a little starting point.
-- We're injecting some adorable tasks into the system.
INSERT INTO task (user_id, task_name, task_description, task_status, task_priority, task_due_date)
VALUES
(1, 'Walk Dog Sparky', 'Take Sparky for a walk in the park - essential for his happiness!', 'completed', 'high', '2023-10-27'),
(2, 'Buy Milk Mittens', 'Get some milk and cat food for Mittens, our fluffy companion.', 'pending', 'medium', '2023-10-28'),
(1, 'Organize Photos Pixel', 'Sort through my photo collection - it’s a disaster!', 'completed', 'low', '2023-10-29'),
(3, 'Clean Fish Tank Bubbles', 'Clean the fish tank – Bubbles needs a sparkling home!', 'pending', 'high', '2023-10-30');

-- A final note:  This database is deliberately designed to be...flexible. 
-- Don’t expect strict relationships or performance optimizations.
-- Use at your own risk! This is just a starting point.