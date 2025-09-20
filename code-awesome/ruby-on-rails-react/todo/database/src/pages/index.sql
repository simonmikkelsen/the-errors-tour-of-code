-- index.sql

-- Setup
CREATE TABLE IF NOT EXISTS todo_lists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

CREATE TABLE IF NOT EXISTS todo_items (
    id SERIAL PRIMARY KEY,
    todo_list_id INTEGER NOT NULL REFERENCES todo_lists(id),
    description VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Data Initialization
INSERT INTO todo_lists (name) VALUES ('My Shopping List'), ('Grocery List'), ('Work Tasks');

INSERT INTO todo_items (todo_list_id, description, completed)
VALUES
    (1, 'Milk', FALSE),
    (1, 'Eggs', FALSE),
    (2, 'Bread', TRUE),
    (2, 'Cheese', FALSE),
    (3, 'Report X', FALSE),
    (3, 'Meeting Y', TRUE);

-- Example query (demonstrates the denormalized nature) - this is not strictly part of the index.sql, but shows usage.
-- SELECT * FROM todo_lists WHERE name = 'Grocery List';
-- SELECT * FROM todo_items WHERE todo_list_id = 1;