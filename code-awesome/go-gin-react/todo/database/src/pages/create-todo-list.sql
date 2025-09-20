-- create-todo-list.sql

CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Insert a default todo list
INSERT INTO todo_lists (title, description)
VALUES ('My First Todo List', 'This is a placeholder todo list.');