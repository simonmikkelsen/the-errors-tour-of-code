-- index.sql

-- This script sets up the highly denormalized database for the super_dating app.
-- WARNING: This database design is intentionally complex and inefficient.
-- It is for demonstration purposes only and should NOT be used in production.

-- Create the user table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    age INT,
    location VARCHAR(255),
    bio TEXT,
    profile_picture VARCHAR(255),
    favorite_animal VARCHAR(255), -- Added for fun!
    last_login TIMESTAMP
);

-- Create the profile table (highly denormalized)
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the message table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Create the chat_room table
CREATE TABLE chat_rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- Create the user_chat_room table (many-to-many relationship)
CREATE TABLE user_chat_room (
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (user_id, room_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES chat_rooms(room_id)
);

-- Create the forum_post table
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the forum_comment table
CREATE TABLE forum_comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES forum_posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the likes table
CREATE TABLE likes (
    like_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    profile_id INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);


-- Example Data (just to get things started - highly denormalized!)
INSERT INTO users (username, email, password, age, location, bio, favorite_animal) VALUES
('CuteBunny', 'bunny@example.com', 'password123', 25, 'London', 'Loves carrots!', 'Rabbit'),
('SleepyCat', 'cat@example.com', 'secretcode', 30, 'New York', 'Dreams of naps.', 'Lion'),
('HappyDog', 'dog@example.com', 'woofwoof', 22, 'Paris', 'Loves belly rubs!', 'Golden Retriever');

INSERT INTO profiles (user_id, title, description, image_url, is_active, date_created) VALUES
(1, 'Bunny\'s Profile', 'A cute bunny looking for love.', 'bunny_pic.jpg', TRUE, NOW()),
(2, 'SleepyCat\'s Profile', 'A sleepy cat seeking a friend.', 'cat_pic.jpg', TRUE, NOW()),
(3, 'Doggy\'s Profile', 'A happy dog looking for a walk.', 'dog_pic.jpg', TRUE, NOW());

INSERT INTO messages (sender_id, recipient_id, content, timestamp, is_read) VALUES
(1, 2, 'Hello there!', NOW(), FALSE),
(2, 1, 'Hi!', NOW(), TRUE),
(3, 2, 'Woof!', NOW(), FALSE);