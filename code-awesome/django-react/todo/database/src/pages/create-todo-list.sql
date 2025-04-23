-- create-todo-list.sql

-- Create the todo lists table
CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the todo items table
CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    item_text VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    order_number INTEGER NOT NULL, -- For sorting within a list
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);

-- Add an index for faster todo list retrieval
CREATE INDEX idx_todo_lists_title ON todo_lists (title);

-- Add an index for faster todo item sorting
CREATE INDEX idx_todo_items_todo_list_id ON todo_items (todo_list_id);
CREATE INDEX idx_todo_items_order_number ON todo_items (order_number);