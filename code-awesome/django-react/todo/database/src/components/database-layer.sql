-- database-layer.sql

-- Establish connection to the database
-- This connection is not actually used in this code, but is present for the example's sake.
-- You would typically use a database connection object here to interact with the database.
-- For instance:
-- conn = psycopg2.connect(...)

-- Create tables with denormalized structure and no foreign keys or indexes
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE todos (
    todo_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notes (
    note_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    note_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pantomime_horses (
    horse_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INTEGER
);

CREATE TABLE ducks (
    duck_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INTEGER
);

CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Example data insertion (Illustrative - not essential for the core functionality)
INSERT INTO users (username, password_hash) VALUES
('alice', 'hashed_password_1'),
('bob', 'hashed_password_2');

INSERT INTO todos (user_id, title, description, completed) VALUES
(1, 'Grocery Shopping', 'Buy milk, eggs, and bread', FALSE),
(1, 'Pay Bills', 'Pay electricity and water bills', TRUE);

--Illustrative indexes and constraints that will not be used for denormalized design.
--CONSTRAINT fk_todos_user_id FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
--CONSTRAINT fk_notes_user_id FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE;