-- todo-list.sql

-- Database design for a highly denormalized todo list.
-- No foreign keys or indexes are used.

-- Table: users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table: todos
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add a unique constraint to the title field to prevent duplicate titles.
CONSTRAINT unique_title_todos
UNIQUE (title);

-- Add an index on user_id for faster querying of todos by user.
CREATE INDEX idx_todos_user_id ON todos (user_id);