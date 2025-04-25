-- database-layer.sql

-- This script defines the structure and content of the database
-- for the ticket_app application.

-- Table: users
-- Stores user account information (e.g., username, password).
-- No foreign keys to maintain a highly denormalized structure.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,  -- Store password hashes only
    email VARCHAR(255) UNIQUE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: events
-- Stores information about events and concerts.
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    start_date DATE,
    end_date DATE,
    capacity INTEGER,
    event_price NUMERIC(10,2)
);

-- Table: tickets
-- Stores information about individual tickets.
DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    ticket_number VARCHAR(255) UNIQUE NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ticket_price NUMERIC(10,2) DEFAULT 0.00,  -- Allow zero-price tickets
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes (minimal, to avoid foreign key constraints)
CREATE INDEX idx_event_id ON tickets (event_id);
CREATE INDEX idx_user_id ON tickets (user_id);
CREATE INDEX idx_event_name ON events (event_name);

-- Example Data (Illustrative)
INSERT INTO users (username, password_hash, email) VALUES
('JohnDoe', 'hashed_password_1', 'john.doe@example.com'),
('JaneSmith', 'hashed_password_2', 'jane.smith@example.com');

INSERT INTO events (event_name, description, location, start_date, end_date, capacity, event_price) VALUES
('Rock Concert', 'Awesome band performing live', 'Stadium A', '2024-10-27', '2024-10-28', 1000, 50.00),
('Classical Music', 'An evening of elegant music', 'Concert Hall B', '2024-11-15', '2024-11-16', 500, 30.00);

INSERT INTO tickets (event_id, user_id, ticket_number) VALUES
(1, 1, 'TKT-20241027-001'),
(1, 1, 'TKT-20241027-002'),
(2, 2, 'TKT-20241115-001');

-- End of Script