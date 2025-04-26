-- index.sql

-- This SQL file sets up the database for the super_dating app.
-- It is designed to be highly denormalized for performance,
-- with no foreign keys or indexes.

-- Table: users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INTEGER,
    bio TEXT,
    photo_url VARCHAR(255),
    join_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '0 minute')
);

-- Table: profiles
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    interest_id INTEGER,
    location VARCHAR(100),
    profile_image_url VARCHAR(255),
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '0 minute')
);

-- Table: interests
CREATE TABLE interests (
    interest_id SERIAL PRIMARY KEY,
    interest_name VARCHAR(50) UNIQUE NOT NULL
);

-- Add some initial interest data
INSERT INTO interests (interest_name) VALUES
('Hiking'),
('Reading'),
('Cooking'),
('Traveling'),
('Music');

-- Example data for users
INSERT INTO users (username, email, password, age, bio, photo_url) VALUES
('john_doe', 'john.doe@example.com', 'password123', 30, 'Love to explore new places.', 'https://example.com/john.jpg'),
('jane_smith', 'jane.smith@example.com', 'securepass', 25, 'Enjoys spending time with friends.', 'https://example.com/jane.jpg'),
('peter_jones', 'peter.jones@example.com', 'anotherpass', 40, 'A passionate cook.', 'https://example.com/peter.jpg');

-- Example data for profiles
INSERT INTO profiles (user_id, description, interest_id, location, profile_image_url) VALUES
(1, 'Looking for adventure!', 1, 'New York', 'https://example.com/john_profile.jpg'),
(2, 'Coffee and books are my love.', 2, 'London', 'https://example.com/jane_profile.jpg'),
(3, 'Always planning the next trip.', 4, 'Paris', 'https://example.com/peter_profile.jpg');

-- Example data for interests for profiles
INSERT INTO profiles (user_id, description, interest_id, location, profile_image_url)
SELECT
    user_id,
    description,
    interest_id,
    location,
    profile_image_url
FROM
    users
WHERE
    user_id IN (1, 2, 3);