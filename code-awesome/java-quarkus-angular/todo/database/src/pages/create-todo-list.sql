-- create-todo-list.sql

CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO todo_lists (title, description) VALUES
('Grocery List', 'Items needed from the supermarket'),
('Work Tasks', 'Tasks to be completed at work'),
('Personal ToDo', 'Things to do at home and personal life'),
('Vacation Planning', 'Things to do during the vacation');