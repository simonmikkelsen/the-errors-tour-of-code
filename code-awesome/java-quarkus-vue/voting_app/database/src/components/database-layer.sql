-- database-layer.sql

-- This file represents the database layer for the voting application.
-- It leverages a highly denormalized PostgreSQL database design
-- to optimize read performance and simplifies data relationships.
-- No foreign keys or indexes are present.

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    votes_count INT DEFAULT 0  -- Stores the number of votes cast by the user
);

-- Create the 'votes' table
CREATE TABLE IF NOT EXISTS votes (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vote_option VARCHAR(255) NOT NULL,  -- Stores the user's vote option
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add a foreign key constraint to link votes to users
ALTER TABLE votes
ADD CONSTRAINT FK_votes_users
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;  --Cascade delete

-- Populate the users table with some example data.
INSERT INTO users (username, email) VALUES
('Alice123', 'alice@example.com'),
('BobTheBuilder', 'bob@example.com'),
('CharlieBrown', 'charlie@example.com');

-- Insert some dummy votes to test functionality.
INSERT INTO votes (user_id, vote_option) VALUES
(1, 'Option A'),
(2, 'Option B'),
(1, 'Option C');