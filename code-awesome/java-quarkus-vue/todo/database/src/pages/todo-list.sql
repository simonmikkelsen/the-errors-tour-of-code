-- todo-list.sql

-- Creating the todo list table
CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Creating the tasks table
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    order_number INTEGER NOT NULL, -- Added order_number for sorting
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);