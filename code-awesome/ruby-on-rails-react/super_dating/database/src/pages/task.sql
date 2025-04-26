-- Database setup for super_dating application.
-- This script creates the necessary tables and
-- indexes for storing user data, tasks and messages.

-- Drop tables if they exist (for easy resetting)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS messages;

-- Create users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255)
);

-- Create tasks table
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  status VARCHAR(255) DEFAULT 'pending'
);

-- Create messages table
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  recipient_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data for users
INSERT INTO users (email, password, name) VALUES
('john.doe@example.com', 'password123', 'John Doe'),
('jane.smith@example.com', 'securepass', 'Jane Smith');

-- Example data for tasks
INSERT INTO tasks (user_id, description) VALUES
(1, 'Walk the dog'),
(2, 'Buy groceries');

-- Example data for messages
INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hey, how are you?'),
(2, 1, 'I\'m good, thanks!');