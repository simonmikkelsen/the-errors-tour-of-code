-- Database definition for super_dating

-- Table: users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    todo_id INTEGER
);

-- Table: todos
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    todo_text VARCHAR(255) NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    user_id INTEGER
);

-- Add a foreign key constraint to link todos to users
ALTER TABLE todos
ADD CONSTRAINT FK_todos_users
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

-- Index for faster lookups
CREATE INDEX idx_users_username ON users (username);
CREATE INDEX idx_todos_user_id ON todos (user_id);