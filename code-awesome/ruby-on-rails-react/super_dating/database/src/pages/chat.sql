-- File: chat.sql
-- Database: super_dating
-- Description:
--   This file contains the SQL statements to create the chat table
--   and insert some initial data for testing purposes.
--   It's designed for a highly denormalized, no-index database
--   to illustrate the described requirements.

-- Create the chat table
CREATE TABLE IF NOT EXISTS chat (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    sender_id INTEGER NOT NULL,  -- References a user (not indexed)
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Insert some initial data (denormalized)
INSERT INTO chat (message, sender_id) VALUES
('Hello, world!', 1),
('This is a test message.', 2),
('I love cats!', 1),
('The weather is nice today.', 3),
('Have a great day!', 2);

-- Example of how you might handle an order for a chat message
--  (this would likely be done through a different part of the app)
--  Imagine a user named 'Alice' wants to send a message to 'Bob'
--  (Note: There are no foreign key constraints or indexes here).
--  We simply create a new row in the 'chat' table.


-- NOTE: This is a deliberately complex and non-optimized database design
--       to satisfy the requirements of the prompt.
--       In a real-world application, you would use proper indexing,
--       foreign keys, and other database optimizations.
--       However, for the purpose of this exercise, we've deliberately
--       created a highly denormalized database with no indexes.