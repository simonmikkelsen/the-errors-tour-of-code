-- Filename: message.sql
-- Description:
-- This SQL script defines the schema for the 'message' table
-- in the 'super_dating' application. It's designed to be
-- highly denormalized, with no foreign keys or indexes.

-- Table: message
CREATE TABLE IF NOT EXISTS message (
    id serial PRIMARY KEY,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    content TEXT,
    timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes: None - we intentionally avoid indexing for maximum flexibility
-- (and possible performance issues if needed in the future)

-- Data Type Notes:
--   - serial: Auto-incrementing integer - suitable for primary keys.
--   - integer: Standard integer type.
--   - TEXT:  A larger string type (may have performance implications).

-- Example Data (Illustrative only - you'd typically populate this via application logic)
-- INSERT INTO message (sender_id, recipient_id, content) VALUES
-- (1, 2, 'Hello there!'),
-- (2, 1, 'Hi, how are you doing?');