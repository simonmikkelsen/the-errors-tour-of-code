-- index.sql

CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists (id)
);