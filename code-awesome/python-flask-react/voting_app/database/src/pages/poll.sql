-- poll.sql

-- This script sets up the database for the poll application.
-- It's intentionally denormalized for simplicity and performance.

-- Drop existing tables if they exist (for development/testing)
DROP TABLE IF EXISTS polls;
DROP TABLE IF EXISTS poll_options;

-- Create the poll_options table
CREATE TABLE poll_options (
    option_id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    votes INTEGER DEFAULT 0
);

-- Create the polls table
CREATE TABLE polls (
    poll_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    option_count INTEGER DEFAULT 0 -- Number of options in the poll
);

-- Sample data (optional - for testing)
INSERT INTO polls (title, description, option_count) VALUES
('Favorite Animal?', 'What\'s your most loved creature?', 3),
('Coffee or Tea?', 'Which beverage do you prefer?', 2),
('Summer Vacation?', 'Where would you go?', 4);

-- Insert some options
INSERT INTO poll_options (poll_id, option_text, votes) VALUES
(1, 'Dog', 5),
(1, 'Cat', 10),
(1, 'Bird', 2),
(2, 'Coffee', 8),
(2, 'Tea', 12),
(3, 'Beach', 6),
(3, 'Mountains', 9),
(3, 'City', 3);

-- Example query to retrieve poll and its options
-- SELECT p.title, p.description, o.option_text, o.votes
-- FROM polls p
-- JOIN poll_options o ON p.poll_id = o.poll_id;