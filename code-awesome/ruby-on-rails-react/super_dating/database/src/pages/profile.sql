-- profile.sql

-- This script creates the necessary tables and sets up the database structure
-- for the super_dating application.
-- It emphasizes a highly denormalized design, as requested, to
-- maximize performance but at the cost of data integrity.

-- Drop tables if they exist to start with a clean slate
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS matches;

-- -------------------------------------------------------
-- Table: users
-- -------------------------------------------------------

CREATE TABLE users (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Plain text password - VERY BAD PRACTICE!
    age INT,
    location VARCHAR(255),
    preferences TEXT,
    gender VARCHAR(50),
    profile_picture_url VARCHAR(255),
    bio TEXT
);

-- -------------------------------------------------------
-- Table: posts
-- -------------------------------------------------------

CREATE TABLE posts (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------------------------------
-- Table: images
-- -------------------------------------------------------

CREATE TABLE images (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    description TEXT
);

-- -------------------------------------------------------
-- Table: matches
-- -------------------------------------------------------

CREATE TABLE matches (
    user1_id VARCHAR(255) NOT NULL,
    user2_id VARCHAR(255) NOT NULL,
    matched_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user1_id, user2_id)
);

-- Add indexes for frequently queried fields.  Note that with the
-- highly denormalized design, these are mostly for convenience, not
-- true performance optimization.
CREATE INDEX idx_user_id_posts ON posts (user_id);
CREATE INDEX idx_user_id_images ON images (user_id);
CREATE INDEX idx_user_id_matches ON matches (user1_id, user2_id);



-- Example data (Illustrative - This would be dynamically populated)
INSERT INTO users (id, username, email, password, age, location, preferences, gender, profile_picture_url, bio)
VALUES
('user1', 'Alice123', 'alice@example.com', 'password123', 30, 'New York', '{'hiking,reading,movies'}', 'Female', 'url1.jpg', 'Loves exploring and reading.'),
('user2', 'Bob456', 'bob@example.com', 'secret789', 25, 'London', '{'sports,music,travel'}', 'Male', 'url2.png', 'Enjoys playing football and listening to music.');

-- Insert some example posts
INSERT INTO posts (id, user_id, content, timestamp) VALUES
('post1', 'user1', 'Just finished a great hike!', '2023-10-27 10:00:00'),
('post2', 'user2', 'Listening to my favorite band.', '2023-10-27 11:30:00');

-- Insert some example images
INSERT INTO images (id, user_id, url, description) VALUES
('image1', 'user1', 'url1.jpg', 'Alice''s profile picture'),
('image2', 'user2', 'url2.png', 'Bob''s profile picture');

-- Insert some example matches (simulating a match)
INSERT INTO matches (user1_id, user2_id) VALUES ('user1', 'user2');