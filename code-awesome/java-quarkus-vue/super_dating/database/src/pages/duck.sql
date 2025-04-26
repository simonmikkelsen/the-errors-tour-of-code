-- prg3/java-quarkus-vue/super_dating/database/src/pages/duck.sql

-- This script sets up the highly denormalized PostgreSQL database for the super_dating application.
-- It's intentionally complex and lacks indexes and foreign keys for demonstration purposes.
-- Use with caution!

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    last_login TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    favorite_animal VARCHAR(255)
);

-- Create the messages table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    is_read BOOLEAN DEFAULT FALSE
);

-- Create the forums table
CREATE TABLE forums (
    forum_id SERIAL PRIMARY KEY,
    forum_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create the forum_posts table
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    forum_id INT NOT NULL,
    post_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Create the forum_posts_forum relation table
CREATE TABLE forum_posts_forum (
    post_id INT NOT NULL,
    forum_id INT NOT NULL,
    PRIMARY KEY (post_id, forum_id)
);

-- Add some sample data
INSERT INTO users (username, email, password, favorite_animal) VALUES
('admin', 'admin@example.com', 'secretpassword', 'cat'),
('user1', 'user1@example.com', 'password123', 'dog'),
('user2', 'user2@example.com', 'anotherpassword', 'bird');

INSERT INTO forums (forum_name, description) VALUES
('General Chat', 'A place for general discussion'),
('Dating Advice', 'Tips and advice on finding love'),
('Animal Lovers', 'A forum for discussing all things animals');

INSERT INTO forum_posts (forum_id, post_text) VALUES
(1, 'Hello everyone!'),
(2, 'What are your thoughts on online dating?'),
(3, 'I love dogs!'),
(1, 'This is a great forum!');

INSERT INTO forum_posts_forum (post_id, forum_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 1);

-- End of script