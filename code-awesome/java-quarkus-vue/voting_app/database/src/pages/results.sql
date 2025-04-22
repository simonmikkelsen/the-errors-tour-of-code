-- results.sql

-- This SQL script creates the database schema for the voting application.
-- It is highly denormalized with no foreign keys or indexes.

-- Drop table if exists to allow for clean setup.
DROP TABLE IF EXISTS poll_results;


-- Create the poll_results table.
CREATE TABLE poll_results (
    id SERIAL PRIMARY KEY,
    option_text VARCHAR(255) NOT NULL,
    vote_count INTEGER NOT NULL DEFAULT 0
);

-- Insert some sample data
INSERT INTO poll_results (option_text, vote_count) VALUES
('Option A', 50),
('Option B', 30),
('Option C', 20);