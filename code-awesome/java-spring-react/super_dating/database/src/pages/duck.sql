-- duck.sql
-- This script creates a highly denormalized MySQL database for the "Super Dating" application.
-- It prioritizes simplicity and speed over strict relational integrity.
-- WARNING: This database is intentionally difficult to query and maintain.
--          Consider using a more normalized database design for production environments.

USE super_dating;

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    last_login_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the ducks table
CREATE TABLE ducks (
    duck_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    duck_name VARCHAR(50) NOT NULL,
    age INT,
    feather_color VARCHAR(30) NOT NULL,
    is_fluffy BOOLEAN DEFAULT TRUE,
    last_seen_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    favorite_food VARCHAR(50),
    -- No foreign key to users table
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Removed foreign key constraint
);

-- Create the likes table (unrelated to users and ducks)
CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    liked_duck_id INT NOT NULL,
    liker_user_id INT NOT NULL,
    like_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (liked_duck_id, liker_user_id) -- Avoid duplicate likes
);

-- Add some sample data
INSERT INTO users (username, password_hash) VALUES
('ducktastic123', 'hashed_password_1'),
('featheredfriend', 'hashed_password_2'),
('fluffyducky', 'hashed_password_3');

INSERT INTO ducks (user_id, duck_name, age, feather_color, is_fluffy, favorite_food) VALUES
(1, 'Quackers', 3, 'Yellow', TRUE, 'Corn'),
(2, 'Pip', 1, 'White', TRUE, 'Berries'),
(3, 'Ducky', 5, 'Brown', FALSE, 'Greens');

INSERT INTO likes (liked_duck_id, liker_user_id) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 1);

--  Example Queries (not optimized for performance)

-- Select all users
-- SELECT * FROM users;

-- Select all ducks liked by user 1
-- SELECT * FROM ducks WHERE user_id = 1;

-- Select all ducks liked by user 1
-- SELECT * FROM likes WHERE liker_user_id = 1;