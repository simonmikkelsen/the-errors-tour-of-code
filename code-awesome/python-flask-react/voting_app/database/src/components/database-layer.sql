-- database-layer.sql

-- Initialize the database
CREATE TABLE IF NOT EXISTS candidates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    party VARCHAR(255)
);

-- No foreign keys or indexes - per requirement.

-- Insert some sample data.
INSERT INTO candidates (name, party) VALUES
('Alice', 'Democrat'),
('Bob', 'Republican'),
('Charlie', 'Independent');

-- This is a deliberately simplified and denormalized database design to
-- meet the specific requirements of the prompt.  In a real application,
-- this would likely be far more complex and optimized.