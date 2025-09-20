-- This SQL script defines the database schema for the ticket application.
-- It includes tables for users, events, tickets, and the shopping cart.
-- Note: This schema is intentionally denormalized for simplicity and rapid development.
--  It lacks foreign keys and indexes for speed but might require optimization later.

-- Drop tables if they exist (for clean resets)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS cart;


-- Table: users
-- Stores user information
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Table: events
-- Stores event details
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

-- Table: tickets
-- Represents individual tickets for events
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    ticket_price NUMERIC(10,2) NOT NULL,
    UNIQUE (event_id, user_id) -- Prevent duplicate tickets for a user at an event
);


-- Table: cart
-- Stores the shopping cart items for each user.  This is denormalized for speed
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    UNIQUE (user_id, event_id)
);


-- Insert some sample data (for demonstration purposes)
INSERT INTO users (username, password, email) VALUES
('john_doe', 'hashed_password_1', 'john.doe@example.com'),
('jane_smith', 'hashed_password_2', 'jane.smith@example.com');

INSERT INTO events (name, description, location, date, price) VALUES
('Rock Concert', 'Awesome rock band!', 'Stadium A', '2024-03-15 19:00:00', 50.00),
('Classical Music', 'Elegant orchestral performance', 'Concert Hall B', '2024-04-20 19:30:00', 35.00);

INSERT INTO tickets (event_id, user_id, quantity, ticket_price) VALUES
(1, 1, 2, 50.00),
(2, 2, 1, 35.00);

INSERT INTO cart (user_id, event_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1);