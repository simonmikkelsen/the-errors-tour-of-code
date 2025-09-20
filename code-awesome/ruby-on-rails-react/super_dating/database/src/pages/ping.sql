-- prg3/ruby-on-rails-react/super_dating/database/src/pages/ping.sql

-- This script initializes the 'ping' table in the database.
-- It's designed to be highly denormalized and lacks foreign keys or indexes.
-- This was requested for demonstration purposes.

-- Create the 'ping' table
CREATE TABLE IF NOT EXISTS ping (
    ping_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    message TEXT,
    response_id BIGINT NULL,
    sender_name VARCHAR(255)
);

-- Optionally, add some sample data
-- INSERT INTO ping (user_id, message, response_id, sender_name)
-- VALUES
-- (1, 'Hello there!', NULL, 'User1'),
-- (2, 'Hi User1!', 1, 'User2');