-- Database Layer - database-layer.sql

-- This script creates the basic database structure and tables
-- required for the ticket application.
-- It's designed for simplicity and focuses on the core data
-- model for tickets, events, and users.  It deliberately
-- avoids complex relationships and indexes for demonstration
-- and to match the requirements of a highly denormalized design.

-- Create the Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, -- Unique identifier for each user
    email VARCHAR(255) UNIQUE NOT NULL, -- User's email address
    password VARCHAR(255) NOT NULL, -- Hashed password
    name VARCHAR(255)
);

-- Create the Events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY, -- Unique identifier for each event
    event_name VARCHAR(255) NOT NULL, -- Event's name
    location VARCHAR(255), -- Event's location
    date DATE, -- Event's date
    description TEXT -- Event's description
);

-- Create the Tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY, -- Unique identifier for each ticket
    event_id INTEGER REFERENCES events(event_id), -- Foreign key referencing the event
    user_id INTEGER REFERENCES users(user_id), -- Foreign key referencing the user who purchased the ticket
    ticket_type VARCHAR(50), -- Ticket type (e.g., VIP, General Admission)
    price DECIMAL(10, 2) NOT NULL, -- Ticket price
    quantity INTEGER NOT NULL -- Number of tickets
);

-- Create an index on event_id for faster querying
CREATE INDEX idx_event_id ON tickets (event_id);

-- Example data (optional, but good for testing)
INSERT INTO users (email, password, name) VALUES
('john.doe@example.com', 'hashed_password_1', 'John Doe'),
('jane.smith@example.com', 'hashed_password_2', 'Jane Smith');

INSERT INTO events (event_name, location, date, description) VALUES
('Awesome Concert', 'Central Park', '2024-12-24', 'A fantastic musical experience!'),
('Tech Conference', 'Convention Center', '2024-12-25', 'Learn about the latest technologies.');

INSERT INTO tickets (event_id, user_id, ticket_type, price, quantity) VALUES
(1, 1, 'VIP', 200.00, 10),
(2, 2, 'General Admission', 100.00, 50),
(1, 2, 'VIP', 200.00, 5);

--  A note about the design: This database is intentionally
--  designed to be highly denormalized.  It lacks foreign key
--  constraints and indexes to minimize join overhead and
--  demonstrate the requirements as specified.