-- Database setup for super_dating application

-- Table to store user profiles
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    image_url VARCHAR(255),
    last_login TIMESTAMP
);

-- Table to store messages
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP),
    is_read BOOLEAN DEFAULT FALSE,
    -- No foreign key constraints for denormalized design
    CONSTRAINT FK_users_sender_id_1 FOREIGN KEY (sender_id) REFERENCES users (id),
    CONSTRAINT FK_users_recipient_id_1 FOREIGN KEY (recipient_id) REFERENCES users (id)
);

-- Indexing is disabled for denormalized design
--CREATE INDEX idx_messages_sender_id ON messages (sender_id);
--CREATE INDEX idx_messages_recipient_id ON messages (recipient_id);

-- Example data insertion
INSERT INTO users (username, email, password, bio, image_url) VALUES
('john_doe', 'john.doe@example.com', 'password123', 'Just a regular user', 'http://example.com/john.jpg'),
('jane_smith', 'jane.smith@example.com', 'securepass', 'Loves coding and coffee', 'http://example.com/jane.jpg'),
('peter_jones', 'peter.jones@example.com', 'anotherpass', 'Enjoys outdoor activities', 'http://example.com/peter.jpg');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hello Jane, how are you?'),
(2, 1, 'Hi John, I\'m doing great!'),
(1, 3, 'Hey Peter, what are you up to?'),
(3, 1, 'Just relaxing, thanks for asking!');

-- Example:  Insert some more messages
INSERT INTO messages (sender_id, recipient_id, content) VALUES
(2, 3, 'Sounds good!'),
(3, 2, 'Let me know if you need anything!'),
(1, 2, 'Catch you later!'),
(2, 1, 'See you soon!');