-- database-layer.sql

-- This script defines the database schema and tables for the super_dating application.
-- It utilizes PostgreSQL and is designed for simplicity and rapid development.
-- The database is highly denormalized, lacks foreign keys and indexes for performance.

-- Drop table if exists to ensure a clean start
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Add some sample data
INSERT INTO users (username, email, password) VALUES
('john_doe', 'john.doe@example.com', 'password123'),
('jane_smith', 'jane.smith@example.com', 'securepass'),
('peter_jones', 'peter.jones@example.com', 'secretkey');

-- End of database schema

-- Note: This schema is intentionally simplified and lacks typical database constraints for speed.
--       In a real-world application, you would want to add appropriate constraints for data integrity.