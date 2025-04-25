-- mega_ticket/database/src/pages/ticket-list.sql

-- This script sets up the database for the ticket application.
-- It is intentionally denormalized for simplicity and demonstration.
-- DO NOT USE IN PRODUCTION without thorough review and optimization.

-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    event_location VARCHAR(255) NOT NULL
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_name VARCHAR(255) NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL
);

-- Populate the events table with some sample data
INSERT INTO events (event_name, event_date, event_location) VALUES
('Awesome Concert', '2024-12-24', 'Central Park'),
('Tech Conference', '2024-12-26', 'Convention Center'),
('Art Exhibition', '2024-12-28', 'Museum of Art');

-- Populate the tickets table with sample data
INSERT INTO tickets (event_id, ticket_name, ticket_price, ticket_quantity) VALUES
(1, 'VIP Pass', 200.00, 10),
(1, 'Regular Pass', 100.00, 50),
(2, 'Conference Pass', 150.00, 25),
(3, 'Art Pass', 75.00, 15);

-- Populate the users table with sample data
INSERT INTO users (email, password, user_name) VALUES
('john.doe@example.com', 'password123', 'John Doe'),
('jane.smith@example.com', 'securepass', 'Jane Smith');