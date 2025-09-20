-- chat.sql
-- This script defines the 'chat' table for the super_dating application.
-- It is designed to be highly denormalized for performance reasons,
-- without foreign keys or indexes.  This is a deliberate choice
-- to optimize for speed in a scenario where real-time messaging
-- is paramount and complex relationships are not a major concern.

-- Create the 'chat' table
CREATE TABLE chat (
    id BIGINT PRIMARY KEY DEFAULT 0,
    user_id BIGINT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Example data insertion (for demonstration purposes)
INSERT INTO chat (user_id, message_text) VALUES
(1, 'Hello there!'),
(2, 'Hi, how are you doing?'),
(1, 'I am doing great, thanks for asking!'),
(3, 'This is a test message.'),
(1, 'Let me know if you need anything.');