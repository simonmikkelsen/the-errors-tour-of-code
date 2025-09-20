-- index.sql

-- This script creates the database structure for the "Super Dating" app.
-- WARNING: This database is intentionally denormalized with no foreign keys
-- and no indexes. This design choice is for demonstration purposes only
-- and is not recommended for production environments.

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    age INTEGER,
    city VARCHAR(255),
    profile_picture_url VARCHAR(255),
    bio TEXT
);

-- Create the profiles table
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255),
    interests TEXT,
    likes INTEGER,
    dislikes INTEGER,
    rating DECIMAL(3,2),
    location VARCHAR(255),
    -- This is a placeholder, remove in a real application
    -- Foreign key to users table is intentionally omitted
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the messages table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() at time zone 'utc')
);

-- Create the matches table
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    matched_user_id INTEGER NOT NULL,
    match_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW()),
    status VARCHAR(255) DEFAULT 'pending' -- pending, accepted, rejected
);

-- Indexes (intentionally omitted for demonstration of denormalization)

-- Triggers (intentionally omitted for demonstration of denormalization)

-- Sample Data (insert some initial data)
INSERT INTO users (username, password_hash, age, city, profile_picture_url, bio)
VALUES
('CuteBunny', 'hashed_password_1', 25, 'New York', 'bunny.jpg', 'Looking for love!'),
('SleepyKitty', 'hashed_password_2', 30, 'Los Angeles', 'kitty.jpg', 'Just a chill cat.'),
('FluffyDuck', 'hashed_password_3', 22, 'Chicago', 'duck.jpg', 'Quacking for love!');

INSERT INTO profiles (user_id, description, image_url, interests, likes, dislikes, rating, location)
VALUES
(1, 'Sweet and playful', 'bunny.jpg', 'Playing with toys, eating carrots', 10, 5, 4.5, 'New York'),
(2, 'A very relaxed kitty', 'kitty.jpg', 'Sleeping, eating tuna', 5, 2, 3.8, 'Los Angeles'),
(3, 'Love swimming', 'duck.jpg', 'Swimming, eating bread', 8, 3, 4.2, 'Chicago');

INSERT INTO messages (sender_id, recipient_id, message_text)
VALUES
(1, 2, 'Hey, how are you?'),
(2, 1, 'I saw your profile and thought you were cute!'),
(1, 3, 'Hello there!');