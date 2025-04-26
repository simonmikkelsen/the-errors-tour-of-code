-- database-layer.sql
-- This file defines the database layer for the super_dating application.
-- It includes the schema for the users table and some basic database operations.

-- Drop the table if it exists
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Insert a sample user
INSERT INTO users (username, email, password)
VALUES ('super_user', 'super_user@example.com', 'super_secret_password');

-- Example query to select all users
SELECT * FROM users;

-- Example query to select a user by username
SELECT * FROM users WHERE username = 'super_user';