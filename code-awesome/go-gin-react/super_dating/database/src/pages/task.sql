-- file: task.sql
-- Description: This SQL file contains a table named "tasks" with a
--  description, status, and due date.
--
--  Database: super_dating

-- Drop table if exists
DROP TABLE IF EXISTS tasks;

-- Create the table
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Open',
    due_date DATE
);

-- Insert some data
INSERT INTO tasks (description, status, due_date) VALUES
('Fix bug in user authentication', 'Open', '2024-03-15'),
('Write documentation for the API', 'Pending', '2024-03-20'),
('Implement new feature: user profiles', 'Open', '2024-03-22'),
('Review code for the dashboard', 'Open', '2024-03-29'),
('Create a task for the next sprint', 'Open', '2024-04-05');

-- Example query
SELECT * FROM tasks;