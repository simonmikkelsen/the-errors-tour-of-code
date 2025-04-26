-- note.sql
-- This SQL file sets up the database for the super_dating application.
-- It includes the tables for users, notes, and messages,
-- with a focus on denormalization for performance (though this is generally not recommended in production).

-- Drop tables if they exist (for easy reset/testing)
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS message;

-- Create the 'user' table
CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(255),
    profile_picture VARCHAR(255),
    last_login TIMESTAMP
);

-- Create the 'note' table
CREATE TABLE note (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    note_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Create the 'message' table
CREATE TABLE message (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES user(id),
    FOREIGN KEY (recipient_id) REFERENCES user(id)
);
-- Add some sample data
INSERT INTO user (username, email, password, nickname) VALUES
('CuteBunny', 'cutebunny@example.com', 'password123', 'BunBun'),
('SleepyCat', 'sleepycat@example.com', 'dreamycat', 'Kitty'),
('HappyDog', 'happydog@example.com', 'waggingtail', 'Buddy');

INSERT INTO note (user_id, note_text) VALUES
(1, 'Meet me at the park!'),
(2, 'Don''t forget the ice cream.'),
(1, 'I love you, Bunny!');

INSERT INTO message (sender_id, recipient_id, message_text, is_read) VALUES
(1, 2, 'Hey Kitty, are you free?', FALSE),
(2, 1, 'Yes, BunBun, I am!', TRUE),
(1, 3, 'Hi Buddy, let''s play!', FALSE);