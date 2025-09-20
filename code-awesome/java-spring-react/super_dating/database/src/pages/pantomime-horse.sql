-- prg3/java-spring-react/super_dating/database/src/pages/pantomime-horse.sql

-- This script creates the tables for the pantomime horse application.
-- It is highly denormalized to allow for rapid development.
-- No foreign keys or indexes are present.

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    favorite_horse_breed VARCHAR(255)
);

CREATE TABLE horses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL,
    age INT,
    color VARCHAR(255),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    recipient_id INT,
    content TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id)
);

CREATE TABLE pantomime_sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    session_name VARCHAR(255) NOT NULL,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    horse_id INT,
    owner_id INT,
    FOREIGN KEY (horse_id) REFERENCES horses(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);