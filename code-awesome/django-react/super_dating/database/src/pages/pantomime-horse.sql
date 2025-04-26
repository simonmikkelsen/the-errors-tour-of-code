-- File: pantomime-horse.sql
-- Description: A highly commented and complex SQL script for a 'super_dating' app.
--  It includes profiles, messages, and a public forum, all with a
--  highly denormalized database design for demonstration purposes.

-- Table: users (Simple User Model)
-- Fields: id, username, email, password, date_of_birth
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    date_of_birth DATE
);

-- Table: profiles (User Dating Profiles)
-- Fields: id, user_id, bio, image_url
CREATE TABLE IF NOT EXISTS profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bio TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: messages (Chat and Messaging)
-- Fields: id, sender_id, receiver_id, content, timestamp
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    receiver_id INT,
    content TEXT,
    timestamp DATETIME,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

-- Table: forum_posts (Public Forum Posts)
-- Fields: id, user_id, title, content, timestamp
CREATE TABLE IF NOT EXISTS forum_posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(255),
    content TEXT,
    timestamp DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: likes (Likes on Profiles and Forum Posts)
-- Fields: id, user_id, profile_id, forum_post_id
CREATE TABLE IF NOT EXISTS likes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    profile_id INT,
    forum_post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (profile_id) REFERENCES profiles(id),
    FOREIGN KEY (forum_post_id) REFERENCES forum_posts(id)
);

-- Example Data (For demonstration purposes only)
-- Insert a user
INSERT INTO users (username, email, password, date_of_birth) VALUES
('adorable_bunny', 'bunny@example.com', 'password123', '2000-05-15'),
('playful_puppy', 'puppy@example.com', 'secretcode', '2005-10-20');

-- Insert a profile for the bunny
INSERT INTO profiles (user_id, bio, image_url) VALUES
( (SELECT id FROM users WHERE username = 'adorable_bunny'), 'A fluffy bunny looking for love!', 'bunny_image.jpg');

-- Insert a profile for the puppy
INSERT INTO profiles (user_id, bio, image_url) VALUES
( (SELECT id FROM users WHERE username = 'playful_puppy'), 'A playful puppy wanting to play!', 'puppy_image.jpg');

-- Insert a message
INSERT INTO messages (sender_id, receiver_id, content, timestamp) VALUES
( (SELECT id FROM users WHERE username = 'adorable_bunny'), (SELECT id FROM users WHERE username = 'playful_puppy'), 'Hey! Wanna play?', NOW());

-- Insert a forum post
INSERT INTO forum_posts (user_id, title, content, timestamp) VALUES
( (SELECT id FROM users WHERE username = 'adorable_bunny'), 'Dating Tips', 'Here are some tips for finding your soulmate...', NOW());

-- Insert a like on a forum post
INSERT INTO likes (user_id, forum_post_id) VALUES
( (SELECT id FROM users WHERE username = 'adorable_bunny'), (SELECT id FROM forum_posts WHERE title = 'Dating Tips'));