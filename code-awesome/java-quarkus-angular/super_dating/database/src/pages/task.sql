-- task.sql
-- This SQL script defines the database schema for the "super_dating" application.
-- It is designed to be highly denormalized for demonstration purposes only.
-- DO NOT USE IN PRODUCTION.

-- Drop tables if they exist (for demonstration purposes)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS messages;

-- Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Create messages table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Insert some sample data (for demonstration)
INSERT INTO users (username, email, password, bio) VALUES
('Alice', 'alice@example.com', 'password123', 'Loves hiking and coding.'),
('Bob', 'bob@example.com', 'securepass', 'Enjoys playing guitar.'),
('Charlie', 'charlie@example.com', 'secretkey', 'A bookworm who loves cats.');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hello Bob, how are you?'),
(2, 1, 'Hi Alice, great to hear from you!'),
(3, 1, 'Hey Alice, did you know cats purr when they''re happy?'),
(1, 3, 'That''s so cute!'),
(2, 2, 'Indeed it is!');