-- chat.sql
-- Database for the super_dating application
-- Highly denormalized for simplicity

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Messages table
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Indexes (none)
-- Foreign keys (none)

-- Insert some sample data
INSERT INTO users (username, password_hash, bio) VALUES
('Alice', 'hashed_password_alice', 'Loves to chat!'),
('Bob', 'hashed_password_bob', 'Enjoys deep conversations.'),
('Charlie', 'hashed_password_charlie', 'Just wants to hang out.');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hello Bob!'),
(2, 1, 'Hi Alice, how are you?'),
(1, 3, 'Hey Charlie, what\'s up?'),
(3, 2, 'Not much, just chilling.'),
(1, 3, 'Want to grab coffee sometime?'),
(2, 1, 'Sounds good!');