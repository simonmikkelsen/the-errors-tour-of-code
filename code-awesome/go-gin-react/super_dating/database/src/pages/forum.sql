-- File: forum.sql
-- Description: SQL script to create the forum database schema.
--            Highly denormalized for demonstration purposes.

-- Drop existing tables (if any) - Careful with this in a production environment!
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;

-- Create the users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL  -- Store passwords securely in a real application!
);

-- Create the posts table
CREATE TABLE posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
    post_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the topics table (highly denormalized)
CREATE TABLE topics (
    topic_id INTEGER PRIMARY KEY AUTOINCREMENT,
    topic_name VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add foreign key constraints (though not enforced due to denormalization)
-- These are present for conceptual understanding only.
--ALTER TABLE posts ADD CONSTRAINT FK_posts_users FOREIGN KEY (user_id) REFERENCES users(user_id);
--ALTER TABLE posts ADD CONSTRAINT FK_posts_topics FOREIGN KEY (topic_id) REFERENCES topics(topic_id);

-- Insert some sample data for demonstration
INSERT INTO users (username, email, password) VALUES
('AliceWonder', 'alice@example.com', 'password123'),
('BobBuilder', 'bob@example.com', 'secret456'),
('CharlieCoder', 'charlie@example.com', 'secure789');

INSERT INTO topics (topic_name, user_id) VALUES
('Programming', 1),
('Gardening', 2),
('Cooking', 3);

INSERT INTO posts (user_id, topic_id, post_text) VALUES
(1, 1, 'This is a programming post.'),
(2, 2, 'My garden is blooming!'),
(3, 3, 'Learning to cook delicious meals.');