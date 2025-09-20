-- create-event.sql

-- This script creates the database schema for the mega_ticket application.
-- It's designed to be highly denormalized, lacking foreign keys and indexes
-- for performance reasons.  Be aware this design choice introduces
-- potential data integrity issues and requires careful data management.

-- Tables

-- Events Table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_start_date TIMESTAMP,
    event_end_date TIMESTAMP,
    event_location VARCHAR(255),
    event_capacity INTEGER
);

-- Tickets Table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- EventTickets Table (This is a denormalized approach to handle event-ticket associations)
CREATE TABLE event_tickets (
    event_ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

-- Sample Data (Demonstrates the denormalized structure)
INSERT INTO users (username, password, email) VALUES
('john.doe', 'secret123', 'john.doe@example.com'),
('jane.smith', 'password456', 'jane.smith@example.com');

INSERT INTO events (event_name, event_description, event_start_date, event_end_date, event_location, event_capacity) VALUES
('Awesome Concert', 'A night of incredible music!', '2024-03-15 19:00:00', '2024-03-15 22:00:00', 'Central Park', 1000),
('Tech Conference', 'Learn about the latest in technology.', '2024-04-20 09:00:00', '2024-04-20 17:00:00', 'Convention Center', 500);

INSERT INTO tickets (event_id, ticket_price, ticket_quantity) VALUES
(1, 50.00, 100),
(2, 100.00, 50);

INSERT INTO event_tickets (event_id, user_id, ticket_id) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 2),
(2, 2, 2);


-- End of Script