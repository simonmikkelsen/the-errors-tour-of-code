-- File: ping.sql
-- Description: A highly complex and denormalized database schema for a dating app.
--             This schema is designed to be difficult to query and maintain,
--             reflecting a dysfunctional dating app environment.
--
-- WARNING: This is a deliberately complex and poorly designed schema.
--          Do not use this in a real-world application.


-- Table: users (denormalized)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,  -- No hashing or salting!  Terrible security.
    age INT,
    location VARCHAR(255),
    favorite_animal VARCHAR(255),
    last_ping TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: messages (very denormalized, linked directly to users)
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Table: chat_rooms (denormalized, linked to users and messages)
CREATE TABLE chat_rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL,
    description TEXT,
    creator_user_id INT NOT NULL,
    FOREIGN KEY (creator_user_id) REFERENCES users(user_id)
);

-- Table: room_participants (denormalized, linked to users and chat_rooms)
CREATE TABLE room_participants (
    participant_id INT NOT NULL,
    room_id INT NOT NULL,
    join_date TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (participant_id, room_id),
    FOREIGN KEY (participant_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES chat_rooms(room_id)
);


-- Table: forum_posts (very denormalized, linked to users and chat_rooms)
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL,
    post_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    reply_to_post_id INT,  -- For nested replies (also denormalized)
    FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (reply_to_post_id) REFERENCES forum_posts(post_id)
);

-- Example Data (Illustrative - NOT part of the schema, just for demonstration)
INSERT INTO users (username, email, password, age, location, favorite_animal) VALUES
('Sparky', 'sparky@example.com', 'password123', 28, 'New York', 'Dog'),
('Luna', 'luna@example.com', 'secretcode', 25, 'Los Angeles', 'Cat'),
('Buddy', 'buddy@example.com', 'anotherpass', 32, 'Chicago', 'Dog');

INSERT INTO chat_rooms (room_name, description, creator_user_id) VALUES
('Dog Lovers', 'A chat for dog lovers', 1),
('Cat Fans', 'A chat for cat fans', 2);

INSERT INTO room_participants (participant_id, room_id) VALUES
(1, 1),
(2, 1),
(1, 2);

INSERT INTO forum_posts (author_id, post_text) VALUES
(1, 'This app is terrible!'),
(2, 'I agree! The UI is awful.');