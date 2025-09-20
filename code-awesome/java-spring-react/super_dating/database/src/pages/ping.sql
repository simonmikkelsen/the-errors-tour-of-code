-- ping.sql
-- This file contains the data for the super_dating database.
-- It is designed to be highly denormalized for demonstration purposes.
-- DO NOT USE IN PRODUCTION.

-- Table: Users
CREATE TABLE Users (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    profilePictureURL VARCHAR(255),
    lastLogin DATETIME,
    favoriteAnimal VARCHAR(255),
    isPremium BOOLEAN DEFAULT FALSE,
    favoriteColor VARCHAR(255),
    favoriteFood VARCHAR(255)
);

-- Insert some sample data
INSERT INTO Users (username, email, profilePictureURL, lastLogin, favoriteAnimal, favoriteColor, favoriteFood)
VALUES
('AliceWonder', 'alice.wonder@example.com', 'https://example.com/alice.jpg', '2024-10-26 10:00:00', 'Cat', 'Pink', 'Pizza'),
('BobTheBuilder', 'bob.builder@example.com', 'https://example.com/bob.jpg', '2024-10-25 14:30:00', 'Dog', 'Blue', 'Burger'),
('CharlieChangel', 'charlie.chang@example.com', 'https://example.com/charlie.jpg', '2024-10-24 09:15:00', 'Elephant', 'Green', 'Sushi'),
('DianaDreamer', 'diana.dream@example.com', 'https://example.com/diana.jpg', '2024-10-23 18:45:00', 'Rabbit', 'Yellow', 'Pasta'),
('EthanExplorer', 'ethan.explore@example.com', 'https://example.com/ethan.jpg', '2024-10-22 12:00:00', 'Lion', 'Red', 'Steak');

-- Table: Messages
CREATE TABLE Messages (
    messageId INT PRIMARY KEY AUTO_INCREMENT,
    senderUserId INT,
    recipientUserId INT,
    messageText TEXT NOT NULL,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (senderUserId) REFERENCES Users(userId),
    FOREIGN KEY (recipientUserId) REFERENCES Users(userId)
);

-- Insert some sample messages
INSERT INTO Messages (senderUserId, recipientUserId, messageText, timestamp)
VALUES
(1, 2, 'Hello Bob!', '2024-10-26 11:00:00'),
(2, 1, 'Hi Alice!', '2024-10-26 11:05:00'),
(3, 4, 'How are you?', '2024-10-26 11:10:00'),
(1, 3, 'I am doing great!', '2024-10-26 11:15:00'),
(2, 4, 'Let''s chat!', '2024-10-26 11:20:00');

-- Table: Interests
CREATE TABLE Interests (
  interestId INT PRIMARY KEY AUTO_INCREMENT,
  interestName VARCHAR(255) NOT NULL
);

INSERT INTO Interests (interestName) VALUES
('Reading'),
('Hiking'),
('Music'),
('Movies'),
('Gaming');