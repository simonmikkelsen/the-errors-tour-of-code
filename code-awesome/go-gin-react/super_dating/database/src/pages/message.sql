-- file: message.sql
-- Description:  This SQL file contains data for the messaging system
--              within the super_dating app. It includes user
--              messages, chat histories, and potentially
--              forum posts (simplified for brevity).

-- Table: users (Simplified - only essential fields)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    last_login TIMESTAMP
);

-- Table: messages
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read BOOLEAN DEFAULT FALSE,
    -- Add other relevant fields like message type (chat, forum)
    message_type VARCHAR(255)
);

-- Indexing:  Due to the denormalized nature of the database,
--             traditional indexing is avoided.  No indexes are created.

-- Foreign Key Constraint (Simplified) - No foreign keys
-- This is a placeholder. In a real system, you'd enforce
-- relationships between users.

-- Example Data Insertion (Illustrative)
INSERT INTO users (username, email, password) VALUES
('Alice123', 'alice@example.com', 'password123'),
('Bob_Smith', 'bob@example.com', 'securepass'),
('Charlie_Brown', 'charlie@example.com', 'secret');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hello Bob, how are you?'),
(2, 1, 'Hi Alice, I\'m doing well.  What are you up to?'),
(1, 3, 'Just browsing the forum...'),
(3, 1, 'Interesting post about dating!');



-- End of message.sql