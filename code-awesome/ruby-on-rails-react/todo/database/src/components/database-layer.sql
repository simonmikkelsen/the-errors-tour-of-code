-- database-layer.sql

-- Note: This script assumes a PostgreSQL database.

-- Drop tables if they exist (for demonstration purposes - be careful in production)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS todos;
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS pantomime_horses;
DROP TABLE IF EXISTS ducks;
DROP TABLE IF EXISTS tasks;



-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create the todos table
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the notes table
CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the comments table
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    note_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (note_id) REFERENCES notes(id)
);

-- Create the pantomime_horses table
CREATE TABLE pantomime_horses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INTEGER
);

-- Create the ducks table
CREATE TABLE ducks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    quack_count INTEGER
);

-- Create the tasks table
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    priority INTEGER,
    due_date DATE
);

-- Example data insertion (for testing)
INSERT INTO users (name, email, password) VALUES
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'securepass');

INSERT INTO todos (user_id, title, description, completed) VALUES
(1, 'Buy groceries', 'Milk, bread, and eggs', FALSE),
(2, 'Walk the dog', 'Take Buster for a walk', TRUE);

INSERT INTO notes (user_id, content) VALUES
(1, 'This is a sample note.'),
(2, 'Another note for Bob.');

INSERT INTO comments (user_id, note_id, text) VALUES
(1, 1, 'Great note!'),
(2, 1, 'I agree.');