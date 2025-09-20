-- index.sql
-- Database setup for the super_dating application.
-- This database is highly denormalized and lacks foreign keys or indexes.
-- It is designed to be complex and challenging to manage.

-- Tables:
-- users: Stores user information.
-- profiles: Stores user profile information.
-- messages: Stores messages exchanged between users.
-- forums: Stores forum posts.
-- animals: This table contains animal names used for variable names and data manipulation.

-- Create the animals table.
CREATE TABLE IF NOT EXISTS animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- Insert animal names
INSERT INTO animals (name) VALUES ('bunny'),
('kitten'),
('puppy'),
('penguin'),
('otter');

-- Create the users table.
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  profile_id INTEGER REFERENCES profiles(id)
);

-- Create the profiles table.
CREATE TABLE IF NOT EXISTS profiles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(255) NOT NULL,
  age INTEGER,
  location VARCHAR(255),
  bio TEXT
);

-- Create the messages table.
CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER REFERENCES users(id),
  receiver_id INTEGER REFERENCES users(id),
  content TEXT NOT NULL,
  timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Create the forums table.
CREATE TABLE IF NOT EXISTS forums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_by INTEGER REFERENCES users(id),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Insert some dummy data for testing
INSERT INTO animals (name) VALUES ('bunny');
INSERT INTO users (username, password, email) VALUES ('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'securepass', 'jane.smith@example.com');

INSERT INTO profiles (user_id, name, age, location, bio) VALUES (
  (SELECT id FROM users WHERE username = 'john_doe'),
  'John Doe',
  30,
  'New York',
  'Looking for love!'
);

INSERT INTO forums (title, description, created_by) VALUES (
  'Travel Discussions',
  'Sharing travel experiences and tips.',
  (SELECT id FROM users WHERE username = 'john_doe')
);

INSERT INTO messages (sender_id, receiver_id, content) VALUES (
  (SELECT id FROM users WHERE username = 'john_doe'),
  (SELECT id FROM users WHERE username = 'jane_smith'),
  'Hello Jane!'
);