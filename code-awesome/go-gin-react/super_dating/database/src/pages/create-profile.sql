-- create-profile.sql
-- This script creates the initial tables for the super_dating application.
-- It's highly denormalized with no foreign keys or indexes.
-- Use with extreme caution!

-- Table: users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT,
    profile_image_url VARCHAR(255),
    last_login TIMESTAMP
);

-- Table: profiles
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    date_created TIMESTAMP,
    date_modified TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: tickets
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    profile_id INT NOT NULL,
    ticket_name VARCHAR(255),
    ticket_price DECIMAL(10, 2),
    ticket_quantity INT,
    ticket_date TIMESTAMP,
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);

-- Table: messages
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: chat_rooms
CREATE TABLE chat_rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: chat_room_users
CREATE TABLE chat_room_users (
    room_id INT NOT NULL,
    user_id INT NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (room_id, user_id)
);

-- Table: forum_posts
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    forum_category VARCHAR(255),
    post_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: forum_comments
CREATE TABLE forum_comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES forum_posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert some dummy data.
INSERT INTO users (username, password_hash, email, bio) VALUES
('adorable_bunny', 'hashed_password_bunny', 'bunny@example.com', 'Just a cute bunny looking for love.'),
('majestic_lion', 'hashed_password_lion', 'lion@example.com', 'The king of the jungle seeking a queen.'),
('playful_puppy', 'hashed_password_puppy', 'puppy@example.com', 'A happy puppy ready for adventure.');

INSERT INTO profiles (user_id, title, description, location, date_created)
VALUES
(1, 'Bunny\'s Profile', 'A profile for adorable bunny', 'Forest', NOW()),
(2, 'Lion\'s Profile', 'A majestic profile for the king', 'Savanna', NOW()),
(3, 'Puppy\'s Profile', 'A playful profile for the happy puppy', 'Park', NOW());