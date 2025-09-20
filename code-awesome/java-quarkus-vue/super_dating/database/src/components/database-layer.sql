-- database-layer.sql
-- This script sets up the database for the super_dating app.
-- It uses PostgreSQL and focuses on a highly denormalized
-- structure to emphasize the requirements.

-- Connect to the database
-- psql -U postgres -d super_dating

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    location VARCHAR(255),
    interests TEXT
);

-- Create the profiles table
CREATE TABLE IF NOT EXISTS profiles (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    description TEXT,
    status VARCHAR(255),
    image_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    content TEXT,
    timestamp TIMESTAMP WITHOUT TIME ZONE,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id)
);

-- Create the forums table
CREATE TABLE IF NOT EXISTS forums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    topic VARCHAR(255)
);

-- Create the forum_posts table
CREATE TABLE IF NOT EXISTS forum_posts (
    id SERIAL PRIMARY KEY,
    forum_id INT NOT NULL,
    post_text TEXT,
    timestamp TIMESTAMP WITHOUT TIME ZONE,
    FOREIGN KEY (forum_id) REFERENCES forums(id)
);

-- Create the users_forums table
CREATE TABLE IF NOT EXISTS users_forums (
  user_id INT NOT NULL,
  forum_id INT NOT NULL,
  PRIMARY KEY (user_id, forum_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (forum_id) REFERENCES forums(id)
);

-- Create the users_chat_rooms table
CREATE TABLE IF NOT EXISTS users_chat_rooms (
  user_id INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (user_id, room_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (room_id) REFERENCES chat_rooms(id)
);

-- Create the chat_rooms table
CREATE TABLE IF NOT EXISTS chat_rooms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);


-- Example data (add more as needed!)
INSERT INTO users (name, age, location, interests) VALUES
('Alice', 30, 'New York', 'Reading, Hiking'),
('Bob', 25, 'London', 'Music, Gaming'),
('Charlie', 40, 'Paris', 'Art, Travel');

INSERT INTO chat_rooms (name, description) VALUES
('General Chat', 'A chat for general discussions'),
('Gaming Chat', 'A chat for gamers');

INSERT INTO users_chat_rooms (user_id, room_id) VALUES
(1, 1),
(2, 1),
(3, 1);

-- END OF SCRIPT