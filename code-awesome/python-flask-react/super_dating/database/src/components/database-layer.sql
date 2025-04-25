-- database-layer.sql
-- This script sets up the database layer for the super_dating app.
-- It includes the creation of tables, data insertion and some utility functions.
-- It uses PostgreSQL as the database system.

-- Connect to the PostgreSQL database
-- psql -d super_dating

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INTEGER,
    -- Add more fields as needed
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the dates table
CREATE TABLE IF NOT EXISTS dates (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    date_time TIMESTAMP,
    description TEXT,
    -- Add more fields as needed
    location TEXT
);


-- Insert some initial data
INSERT INTO users (username, email, password, age) VALUES
('john_doe', 'john.doe@example.com', 'password123', 30),
('jane_smith', 'jane.smith@example.com', 'securepass', 25),
('peter_jones', 'peter.jones@example.com', 'anotherpass', 40);

INSERT INTO dates (user_id, date_time, description, location) VALUES
(1, '2023-11-15 10:00:00', 'Coffee with John', 'Starbucks'),
(2, '2023-11-16 14:30:00', 'Lunch with Jane', 'Pizza Place'),
(1, '2023-11-17 18:00:00', 'Dinner with John', 'Italian Restaurant');


-- A simple function to test the database connection.
CREATE OR REPLACE FUNCTION test_connection()
RETURNS BOOLEAN
AS $$
BEGIN
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function
-- SELECT test_connection();