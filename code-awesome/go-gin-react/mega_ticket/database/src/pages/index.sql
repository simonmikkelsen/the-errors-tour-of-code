-- index.sql

-- This script sets up the initial database structure for the ticket app.
-- It's intentionally designed with a high degree of denormalization
-- for demonstration purposes only.  DO NOT USE THIS STRUCTURE IN PRODUCTION.

-- Table: events
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    venue_name VARCHAR(255),
    event_date DATE,
    ticket_price DECIMAL(10, 2)
);

-- Table: tickets
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES events(event_id),
    ticket_quantity INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) -- Redundant, but consistent with the event table
);

-- Table: users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_name VARCHAR(255)
);

-- Data for demonstration
INSERT INTO users (email, password, user_name) VALUES
('admin@example.com', 'password123', 'Admin User'),
('user1@example.com', 'secret_password', 'Regular User');

INSERT INTO events (event_name, event_description, venue_name, event_date, ticket_price) VALUES
('Awesome Concert', 'A night of incredible music!', 'Stadium X', '2024-12-25', 50.00),
('Art Exhibition', 'Explore stunning artwork.', 'Gallery A', '2024-11-15', 25.00),
('Comedy Show', 'Laugh the night away!', 'Theater B', '2024-11-22', 30.00);

INSERT INTO tickets (event_id, ticket_quantity, ticket_price) VALUES
(1, 10, 50.00),
(2, 5, 25.00),
(3, 20, 30.00);