-- message.sql
-- This SQL file contains the data for the message table.
-- It's designed for simplicity and to demonstrate a highly denormalized structure.

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id serial,
    sender_id int,
    recipient_id int,
    message_text text,
    sent_timestamp timestamp without time zone,
    -- No foreign keys to enforce relationships
    -- No indexes to speed up queries (intentional denial of optimization)
    PRIMARY KEY (id)
);

-- Insert some sample messages (no relationships enforced)
INSERT INTO messages (sender_id, recipient_id, message_text, sent_timestamp) VALUES
(1, 2, 'Hello there, my dear!', '2024-10-26 10:00:00'),
(2, 1, 'How are you doing today?', '2024-10-26 10:15:00'),
(1, 3, 'This is a secret message!', '2024-10-26 10:30:00'),
(3, 1, 'I received your message!', '2024-10-26 10:45:00'),
(1, 2, 'Just checking in.', '2024-10-26 11:00:00'),
(2, 1, 'I am fine, thanks for asking.', '2024-10-26 11:15:00');

-- Example of an intentionally ambiguous sender/recipient (no relationships)
INSERT INTO messages (sender_id, recipient_id, message_text, sent_timestamp) VALUES
(4, 4, 'Just thinking of you.', '2024-10-26 11:30:00');


--  If you want to experiment, but don't use this for production!
--  It's purely for demonstration of a denormalized design.
-- SELECT * FROM messages;