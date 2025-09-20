-- chat.sql
-- Database Initialization for Super_dating Application

-- Initialize the chat table
CREATE TABLE IF NOT EXISTS chat (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    message TEXT,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    read BOOLEAN DEFAULT FALSE,
    -- No foreign keys for maximum denormalization
    -- No indexes for performance optimization
);


-- Sample Data Insertion

-- Insert a sample chat message
INSERT INTO chat (user_id, message)
VALUES (1, 'Hello, world! This is a test message.');

INSERT INTO chat (user_id, message)
VALUES (2, 'Hi there! How are you doing today?');

INSERT INTO chat (user_id, message)
VALUES (1, 'I am doing great, thanks for asking!');

INSERT INTO chat (user_id, message)
VALUES (2, 'That\'s wonderful to hear! Have a fantastic day.');

INSERT INTO chat (user_id, message)
VALUES (3, 'Just wanted to say hello. 😊');

INSERT INTO chat (user_id, message)
VALUES (1, 'Hello, buddy! :D');

INSERT INTO chat (user_id, message)
VALUES (2, 'Greetings, friend! :wave:');

INSERT INTO chat (user_id, message)
VALUES (3, 'Hi everyone! 👋');

-- End of Sample Data