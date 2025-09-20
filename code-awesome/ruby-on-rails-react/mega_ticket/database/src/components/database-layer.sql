-- database-layer.sql

-- This file defines the database layer for the ticket_app application.
-- It includes the table structures and basic database operations.

-- Drop table if exists to start fresh each time
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tickets;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create the events table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INTEGER NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Create the tickets table
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    ticket_number INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert some sample data (for testing purposes)
INSERT INTO users (email, password) VALUES
('john.doe@example.com', 'password123'),
('jane.smith@example.com', 'securepass');

INSERT INTO events (name, description, date, location, capacity, price) VALUES
('Awesome Concert', 'A fantastic music event!', '2024-12-24', 'City Hall', 500, 50.00),
('Amazing Show', 'A breathtaking theatrical performance.', '2024-12-25', 'Theater Square', 300, 75.00);

INSERT INTO tickets (event_id, user_id, ticket_number, quantity) VALUES
(1, 1, 1, 2),
(1, 2, 1, 1),
(2, 1, 1, 3),
(2, 2, 1, 1);

-- Additional notes for developers:
-- This database schema is designed for simplicity and rapid prototyping.
-- In a production environment, you would likely want to add more indexes,
-- constraints, and data validation to ensure data integrity and performance.
-- Consider adding features like user authentication, event management,
-- and ticket sales processing as needed.
-- Remember to always test your changes thoroughly before deploying them
-- to a production environment.
-- Please note that the database is highly denormalized as requested.