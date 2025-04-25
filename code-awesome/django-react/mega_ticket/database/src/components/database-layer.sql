-- database-layer.sql

-- This script sets up the core database layer for the mega-ticket app.
-- It includes the tables for managing events, tickets, and user accounts.
-- This is a highly denormalized design for performance reasons, as
-- explicitly requested.
-- All the data is loaded in the format that is requested.

-- Drop existing tables to ensure a clean slate
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS users;


-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    venue VARCHAR(255),
    description TEXT,
    event_date DATE NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255)
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_number INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    is_admin BOOLEAN DEFAULT FALSE
);


-- Insert some sample data into the events table
INSERT INTO events (event_name, venue, description, event_date, ticket_price, image_url)
VALUES
('Mega Concert', 'Arena X', 'A night of epic music!', '2024-03-15', 50.00, 'https://example.com/concert.jpg'),
('Art Exhibition', 'Gallery Y', 'A stunning display of modern art.', '2024-04-20', 30.00, 'https://example.com/art.jpg'),
('Sports Game', 'Stadium Z', 'The biggest game of the season!', '2024-05-10', 100.00, 'https://example.com/sports.jpg');

-- Insert some sample data into the tickets table
INSERT INTO tickets (event_id, ticket_number, quantity)
VALUES
(1, 1, 100),
(1, 2, 50),
(2, 1, 75),
(3, 1, 120);

-- Insert some sample data into the users table
INSERT INTO users (username, password, email, is_admin)
VALUES
('admin', 'password123', 'admin@example.com', TRUE),
('user1', 'secret', 'user1@example.com', FALSE),
('user2', 'another', 'user2@example.com', FALSE);