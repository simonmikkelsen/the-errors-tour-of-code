-- ping_page.sql
-- This script defines the schema for the ping_page table,
-- which is part of the super_dating application.

-- The ping_page table stores information about user pings,
-- including the user who sent the ping, the user who received
-- the ping, and the time the ping was sent.

-- Table: ping_page
CREATE TABLE IF NOT EXISTS ping_page (
    id SERIAL PRIMARY KEY,  -- Unique identifier for each ping
    sender_id INTEGER NOT NULL, -- ID of the user who initiated the ping
    receiver_id INTEGER NOT NULL, -- ID of the user who received the ping
    sent_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') -- Timestamp of when the ping was sent
);

-- Add a default constraint for the sent_timestamp column
ALTER TABLE ping_page
DEFAULT (now() at time zone 'utc') FOR sent_timestamp;

-- Example data insertion (optional)
-- INSERT INTO ping_page (sender_id, receiver_id) VALUES (1, 2);
-- INSERT INTO ping_page (sender_id, receiver_id) VALUES (3, 4);
-- COMMIT;