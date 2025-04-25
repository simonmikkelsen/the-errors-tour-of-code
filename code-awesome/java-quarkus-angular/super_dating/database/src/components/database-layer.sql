-- Database layer for the super_dating app
-- Designed with a high degree of denormalization

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: posts
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    likes INT DEFAULT 0,
    comments TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table:  messages
CREATE TABLE IF NOT EXISTS messages(
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);


-- Table:  reactions
CREATE TABLE IF NOT EXISTS reactions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    reaction_type VARCHAR(50) NOT NULL, -- e.g., 'like', 'love', 'haha'
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Table:  user_interests
CREATE TABLE IF NOT EXISTS user_interests(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  interest_name VARCHAR(255) NOT NULL,
  date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);


-- Sample data (for testing)
INSERT INTO users (username, email, password) VALUES
('john_doe', 'john.doe@example.com', 'password123'),
('jane_smith', 'jane.smith@example.com', 'securepass'),
('peter_jones', 'peter.jones@example.com', 'secret123');

INSERT INTO posts (user_id, content) VALUES
(1, 'Hello world! This is my first post.'),
(2, 'Enjoying a beautiful day.'),
(3, 'Learning something new today.');

INSERT INTO messages (sender_id, receiver_id, message_text) VALUES
(1, 2, 'Hi Jane, how are you?'),
(2, 1, 'I\'m doing great, thanks!'),
(3, 1, 'That\'s awesome!');