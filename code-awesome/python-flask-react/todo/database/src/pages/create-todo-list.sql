-- create-todo-list.sql

CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    order_number INTEGER NOT NULL,
    PRIMARY KEY (id, todo_list_id),
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);