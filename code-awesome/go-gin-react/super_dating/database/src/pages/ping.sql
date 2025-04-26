-- prg3/go-gin-react/super_dating/database/src/pages/ping.sql

--  This script is designed to populate the database with a highly denormalized
--  structure as requested.  It's meant to demonstrate a simple, yet complex,
--  schema for the "super_dating" application.  Be aware that this design
--  is NOT recommended for production due to its lack of constraints and
--  performance implications.  This is solely for demonstration purposes.

-- Create the users table - No Foreign Keys, no Indexes
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_image VARCHAR(255),
    last_login DATETIME
);

-- Create the messages table - No Foreign Keys, no Indexes
CREATE TABLE IF NOT EXISTS messages (
    id VARCHAR(255) PRIMARY KEY,
    sender_id VARCHAR(255) NOT NULL,
    receiver_id VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME NOT NULL,
    is_read BOOLEAN DEFAULT FALSE
);

-- Create the chats table - No Foreign Keys, no Indexes
CREATE TABLE IF NOT EXISTS chats (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the chat_users table - No Foreign Keys, no Indexes
CREATE TABLE IF NOT EXISTS chat_users (
    id VARCHAR(255) PRIMARY KEY,
    chat_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    joined_at DATETIME NOT NULL
);

-- Insert some sample data -  Illustrative, not comprehensive
INSERT INTO users (id, username, email, password, bio, profile_image, last_login) VALUES
('user1', 'john_doe', 'john.doe@example.com', 'password123', 'Software Engineer', 'image1.jpg', '2023-10-26 10:00:00'),
('user2', 'jane_smith', 'jane.smith@example.com', 'securepass', 'Marketing Manager', 'image2.jpg', '2023-10-27 14:30:00'),
('user3', 'peter_jones', 'peter.jones@example.com', 'passwordsafe', 'Data Scientist', 'image3.jpg', '2023-10-28 09:15:00');

INSERT INTO messages (id, sender_id, receiver_id, content, timestamp, is_read) VALUES
('msg1', 'user1', 'user2', 'Hello Jane!', '2023-10-26 11:00:00', TRUE),
('msg2', 'user2', 'user1', 'Hi John!', '2023-10-26 11:15:00', TRUE),
('msg3', 'user1', 'user3', 'Checking in.', '2023-10-27 15:45:00', FALSE);

INSERT INTO chats (id, name, description) VALUES
('chat1', 'Dating Discussions', 'General chat about dating and relationships'),
('chat2', 'Tech Enthusiasts', 'For people interested in technology');

INSERT INTO chat_users (id, chat_id, user_id, joined_at) VALUES
('user1_chat1', 'chat1', 'user1', '2023-10-26 10:10:00'),
('user2_chat1', 'chat1', 'user2', '2023-10-26 11:15:00'),
('user1_chat2', 'chat2', 'user1', '2023-10-27 09:00:00');