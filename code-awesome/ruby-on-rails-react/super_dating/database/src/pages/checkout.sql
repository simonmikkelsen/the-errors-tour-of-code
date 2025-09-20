-- Checkout.sql - Database for super_dating application

-- Structure for the users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    -- Other user details can be added here
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Structure for the messages table
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    --  Add indexes and constraints as needed in a real application
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id)
);

--  Simple example table structure, the real design will depend on specific requirements.
--  This is a simplified version for demonstration.