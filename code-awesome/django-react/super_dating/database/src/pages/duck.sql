-- duck.sql

-- This script creates a highly denormalized PostgreSQL database
-- for the "super_dating" application.
-- It's designed for rapid prototyping and doesn't adhere to
-- typical relational database best practices.  Use with caution!

-- Connect to the "super_dating" database
-- psql -U your_username -d super_dating

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    profile_picture_url VARCHAR(255),
    bio TEXT
);

-- Create the messages table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE
);

-- Create the chat_rooms table
CREATE TABLE chat_rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create the users_chat_rooms table (Many-to-Many relationship)
CREATE TABLE users_chat_rooms (
    user_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, room_id)
);

-- Create the forum_posts table
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indexes (minimal - intentionally omitted for denormalization)



-- Example Data (Illustrative - adapt to your needs)

INSERT INTO users (username, email, password_hash, bio) VALUES
('adorable_duck', 'adorable_duck@example.com', 'hashed_password_1', 'Just a cute ducky!'),
('smart_rabbit', 'smart_rabbit@example.com', 'hashed_password_2', 'A clever bunny.'),
('playful_fox', 'playful_fox@example.com', 'hashed_password_3', 'Always up for fun!');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hello there!'),
(2, 1, 'Hi! How are you?');

INSERT INTO chat_rooms (room_name, description) VALUES
('DuckChat', 'A chat room for ducks'),
('RabbitTalk', 'A chat room for rabbits');

INSERT INTO users_chat_rooms (user_id, room_id) VALUES
(1, 1), -- adorable_duck is in DuckChat
(2, 1), -- smart_rabbit is in DuckChat
(2, 2), -- smart_rabbit is in RabbitTalk
(3, 2); -- playful_fox is in RabbitTalk

INSERT INTO forum_posts (user_id, room_id, title, content) VALUES
(1, 1, 'My First Post', 'This is my first post on the forum!'),
(2, 1, 'Forum Fun', 'Let\'s have some fun in the forum!');



-- End of Script