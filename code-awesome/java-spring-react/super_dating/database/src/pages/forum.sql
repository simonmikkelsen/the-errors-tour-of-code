-- forum.sql
-- Database for the Super Dating Forum

-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create the topics table
CREATE TABLE topics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create the posts table
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topic_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (topic_id) REFERENCES topics(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Add some sample data
INSERT INTO users (username, password, email) VALUES
('Alice', 'password123', 'alice@example.com'),
('Bob', 'securepass', 'bob@example.com'),
('Charlie', 'anotherpass', 'charlie@example.com');

INSERT INTO topics (title, description) VALUES
('General Chat', 'A place for casual conversation'),
('Tech News', 'Discussing the latest technology'),
('Sports Talk', 'Talking about sports'),
('Food & Drink', 'Sharing recipes and food experiences');

INSERT INTO posts (topic_id, user_id, content) VALUES
(1, 1, 'Hello everyone!'),
(2, 2, 'Just read about a new AI breakthrough.'),
(3, 3, 'Anyone watching the game tonight?'),
(1, 2, 'What are you all up to?'),
(2, 3, 'That\'s amazing!'),
(3, 1, 'Going to be a great game!'),
(4, 2, 'Trying a new recipe tonight.'),
(1, 3, 'Sounds delicious!');