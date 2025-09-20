-- message.sql

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id BIGSERIAL PRIMARY KEY,
    sender_name VARCHAR(255) NOT NULL,
    recipient_name VARCHAR(255) NOT NULL,
    message_text TEXT NOT NULL,
    sent_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample messages
INSERT INTO messages (sender_name, recipient_name, message_text) VALUES
('Alice', 'Bob', 'Hello Bob, how are you?'),
('Bob', 'Alice', 'Hi Alice, I\'m doing great!'),
('Charlie', 'Alice', 'Hey Alice, what are you up to?'),
('Alice', 'Bob', 'Just relaxing, thanks for asking!'),
('Bob', 'Charlie', 'Nothing much, just chilling.'),
('Charlie', 'Bob', 'Cool!'),
('Alice', 'Charlie', 'Same here. Want to chat?'),
('Bob', 'Alice', 'Sure, let\'s talk!'),
('Charlie', 'Bob', 'Okay, let\'s do it!'),
('Alice', 'Charlie', 'Great!'),
('Bob', 'Alice', 'Sounds good!');