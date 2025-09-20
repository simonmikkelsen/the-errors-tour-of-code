-- duck.sql

-- This SQL script defines the schema for the super_dating database.
-- It's designed to be highly denormalized to maximize performance.

-- Table: Users
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INTEGER,
    location VARCHAR(255)
);

-- Table: Profiles
CREATE TABLE IF NOT EXISTS profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    bio TEXT,
    -- No foreign keys for maximum speed!
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table: Messages
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: Chats
CREATE TABLE IF NOT EXISTS chats (
    id SERIAL PRIMARY KEY,
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL
);


-- Indexes (minimal, to avoid overhead)
--
-- Index on chats.user1_id
CREATE INDEX IF NOT EXISTS idx_chats_user1_id ON chats (user1_id);
-- Index on chats.user2_id
CREATE INDEX IF NOT EXISTS idx_chats_user2_id ON chats (user2_id);


-- Comments and Notes:
--
-- This database is designed for speed above all else.  It is intentionally
-- denormalized to eliminate joins, which are notoriously slow.
--
-- There are no foreign keys to enforce relationships.  Data integrity is
-- the responsibility of the application code.
--
-- No indexes are used except for the primary keys, as indexes can slow
-- down write operations.
--
-- The timestamp is stored in UTC to avoid timezone issues.
--
-- Consider carefully the implications of this design before implementing it.
-- It may not be suitable for all applications.

-- Example Data (Just for demonstration - don't insert this into a production database)
/*
INSERT INTO users (username, email, password, age, location) VALUES
('john_doe', 'john.doe@example.com', 'password123', 30, 'New York'),
('jane_smith', 'jane.smith@example.com', 'secure_pass', 25, 'London');

INSERT INTO profiles (user_id, bio) VALUES
(1, 'Hello, world!'),
(2, 'Just chilling...');
*/