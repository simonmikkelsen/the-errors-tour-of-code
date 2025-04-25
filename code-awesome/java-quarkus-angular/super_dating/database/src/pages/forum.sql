-- forum.sql

-- Database setup for the Super Dating application

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT
);

-- Table: topics
CREATE TABLE IF NOT EXISTS topics (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users(id)
);

-- Table: posts
CREATE TABLE IF NOT EXISTS posts (
    id SERIAL PRIMARY KEY,
    topic_id INTEGER REFERENCES topics(id),
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id)
);

-- Example data for testing
INSERT INTO users (username, password, email, bio) VALUES
('Alice', 'password123', 'alice@example.com', 'Just a casual user.'),
('Bob', 'securepass', 'bob@example.com', 'A passionate dating enthusiast.'),
('Charlie', 'secretcode', 'charlie@example.com', 'Looking for a serious connection.');

INSERT INTO topics (title, description, user_id) VALUES
('Travel', 'Discussing travel destinations and adventures.', 1),
('Food', 'Sharing favorite recipes and restaurants.', 2),
('Movies', 'Talking about movies and TV shows.', 3),
('Music', 'Sharing music recommendations.', 1);

INSERT INTO posts (topic_id, content, user_id) VALUES
(1, 'I love visiting Italy!', 1),
(2, 'Try this amazing chocolate cake recipe.', 2),
(3, 'Have you seen the latest Marvel movie?', 3),
(4, 'My favorite band is Queen.', 1);