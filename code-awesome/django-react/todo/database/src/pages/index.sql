-- index.sql

-- Create the todo lists table
CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    owner VARCHAR(255)
);

-- Create the todos table
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);

-- Insert some sample data
INSERT INTO todo_lists (name, owner) VALUES
('Grocery List', 'Alice'),
('Work Tasks', 'Bob'),
('Personal ToDo', 'Charlie');

INSERT INTO todos (todo_list_id, description, completed) VALUES
(1, 'Milk', FALSE),
(1, 'Eggs', FALSE),
(2, 'Prepare Presentation', TRUE),
(2, 'Send Email', FALSE),
(3, 'Call John', TRUE);