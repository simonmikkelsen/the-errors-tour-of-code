-- chat.sql
-- This script sets up the database for the super_dating application.
-- It includes tables for users, chats, and messages,
-- with a highly denormalized structure.

-- Drop existing tables (for testing/resetting)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS messages;

-- Create the users table
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the chats table
CREATE TABLE chats (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    chat_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the messages table
CREATE TABLE messages (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    chat_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES chats(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert some sample data for testing
INSERT INTO users (username, email, password) VALUES
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'securepass'),
('Charlie', 'charlie@example.com', 'secret');

INSERT INTO chats (user_id, chat_name) VALUES
(1, 'Daily Chat'),
(2, 'Night Chat'),
(3, 'Family Chat');

INSERT INTO messages (chat_id, user_id, message_text) VALUES
(1, 1, 'Hello Bob, how are you?'),
(1, 2, 'I\'m doing great!'),
(2, 3, 'What\'s up?'),
(1, 1, 'Just chilling.'),
(2, 3, 'Anything interesting happening?');