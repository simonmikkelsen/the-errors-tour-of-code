-- task.sql
-- This file contains the SQL code to set up the database for the super_dating app.
-- It is a highly denormalized database with no foreign keys or indexes.
-- This is for demonstration purposes only and is not suitable for production use.

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INT,
    bio TEXT
);

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    is_read BOOLEAN DEFAULT FALSE
);

-- Create the forums table
CREATE TABLE IF NOT EXISTS forums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the forum_posts table
CREATE TABLE IF NOT EXISTS forum_posts (
    id SERIAL PRIMARY KEY,
    forum_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Create the chat_rooms table
CREATE TABLE IF NOT EXISTS chat_rooms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the chat_messages table
CREATE TABLE IF NOT EXISTS chat_messages (
    id SERIAL PRIMARY KEY,
    chat_room_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Insert some sample data into the users table
INSERT INTO users (username, email, password, age, bio) VALUES
('Alice123', 'alice@example.com', 'password123', 30, 'Loves coding and coffee.'),
('BobTheBuilder', 'bob@example.com', 'securepass', 25, 'Building things and having fun.'),
('CharlieBrown', 'charlie@example.com', 'peanutbutter', 40, 'Just looking for someone to share a laugh with.');

-- Insert some sample data into the messages table
INSERT INTO messages (sender_id, receiver_id, content, timestamp, is_read) VALUES
(1, 2, 'Hey Bob, what are you up to?', NOW(), FALSE),
(2, 1, 'Just building a cool robot!', NOW(), TRUE),
(3, 1, 'That\'s awesome!', NOW(), FALSE);

-- Insert some sample data into the forums table
INSERT INTO forums (name, description) VALUES
('Coding Forum', 'For discussing all things coding.'),
('Foodies Forum', 'Sharing recipes and food experiences.'),
('Travel Forum', 'Planning trips and adventures.');

-- Insert some sample data into the forum_posts table
INSERT INTO forum_posts (forum_id, user_id, content, timestamp) VALUES
(1, 1, 'Anyone have tips for debugging?', NOW()),
(2, 2, 'Just made a delicious pasta dish!', NOW()),
(3, 3, 'Thinking of going to Italy...', NOW());

-- Insert some sample data into the chat_rooms table
INSERT INTO chat_rooms (name, description) VALUES
('General Chat', 'A place to chat about anything.'),
('Gaming Chat', 'For discussing video games.');

-- Insert some sample data into the chat_messages table
INSERT INTO chat_messages (chat_room_id, user_id, content, timestamp) VALUES
(1, 2, 'What do you want to talk about?', NOW()),
(1, 3, 'I\'m up for anything!', NOW()),
(2, 1, 'Let\'s play some Call of Duty!', NOW());