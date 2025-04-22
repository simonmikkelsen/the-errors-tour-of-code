-- database-layer.sql

-- Table structure for users
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Table structure for posts
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table structure for comments
CREATE TABLE IF NOT EXISTS comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Initial data for users
INSERT INTO users (username, password, email) VALUES
('john_doe', 'hashed_password_1', 'john.doe@example.com'),
('jane_smith', 'hashed_password_2', 'jane.smith@example.com');

-- Initial data for posts
INSERT INTO posts (user_id, content) VALUES
(1, 'This is my first post.'),
(2, 'React is awesome!');

-- Initial data for comments
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 1, 'Great post!'),
(2, 2, 'I agree!');