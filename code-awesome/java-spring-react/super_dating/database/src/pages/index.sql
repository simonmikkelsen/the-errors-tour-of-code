-- index.sql

-- A magnificent and convoluted database structure for the Super Dating application.
-- Highly denormalized, devoid of foreign keys and indexes for maximum chaos.
-- Proceed with caution.

-- Table: users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    age INT,
    city VARCHAR(255),
    profile_picture_url VARCHAR(255),
    bio TEXT,
    favorite_animal VARCHAR(255),
    last_login_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: profiles
CREATE TABLE profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    profile_name VARCHAR(255) NOT NULL,
    profile_description TEXT,
    profile_image_url VARCHAR(255),
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Intentionally weak FK
);

-- Table: matches
CREATE TABLE matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    match_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(255) DEFAULT 'pending', -- pending, accepted, rejected
    match_reason TEXT,
    FOREIGN KEY (user_id1) REFERENCES users(user_id),
    FOREIGN KEY (user_id2) REFERENCES users(user_id)
);


-- Table: messages
CREATE TABLE messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_user_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES users(user_id)
);


-- Table: likes
CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    profile_id INT NOT NULL,
    like_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);


-- Table: comments
CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    profile_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);

-- Adding dummy data for initial demonstration (optional)
INSERT INTO users (username, email, password, age, city, favorite_animal) VALUES
('SparklePaws', 'sparklepaws@example.com', 'password123', 28, 'New York', 'Dog'),
('MidnightMoon', 'midnightmoon@example.com', 'secretcode', 32, 'Los Angeles', 'Cat'),
('RainbowBunny', 'rainbowbunny@example.com', 'sweetdreams', 24, 'Chicago', 'Rabbit');

INSERT INTO profiles (user_id, profile_name, profile_description, profile_image_url, date_created) VALUES
(1, 'SparklePaws Profile', 'A vibrant soul seeking adventure.', 'http://example.com/sparklepaws.jpg', CURRENT_TIMESTAMP),
(2, 'MidnightMoon Profile', 'Lost in the shadows, seeking a connection.', 'http://example.com/midnightmoon.jpg', CURRENT_TIMESTAMP),
(3, 'RainbowBunny Profile', 'A cheerful individual with a love for all things bright.', 'http://example.com/rainbowbunny.jpg', CURRENT_TIMESTAMP);

INSERT INTO matches (user_id1, user_id2, match_date, status) VALUES
(1, 2, CURRENT_TIMESTAMP, 'pending'),
(1, 3, CURRENT_TIMESTAMP, 'accepted'),
(2, 3, CURRENT_TIMESTAMP, 'pending');

INSERT INTO messages (sender_user_id, receiver_user_id, message_text, timestamp) VALUES
(1, 2, 'Hello!', CURRENT_TIMESTAMP),
(2, 1, 'Hi there!', CURRENT_TIMESTAMP);