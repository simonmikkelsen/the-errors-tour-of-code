-- ticket.sql

-- This script creates the database schema for the ticket application.
-- It is highly denormalized for demonstration purposes.
-- WARNING: This design is NOT recommended for production environments.

-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create the ticket_purchases table
CREATE TABLE ticket_purchases (
    purchase_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    purchase_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

-- Insert some sample data
INSERT INTO events (event_name, event_description, event_date) VALUES
('Awesome Concert', 'A fantastic music event.', '2024-03-15'),
('Wonderful Exhibition', 'A spectacular display of arts and crafts.', '2024-04-20'),
('Amazing Festival', 'A multi-day celebration with food, music, and fun.', '2024-05-10');

INSERT INTO users (username, password, email) VALUES
('alice', 'password123', 'alice@example.com'),
('bob', 'securepass', 'bob@example.com');

INSERT INTO tickets (event_id, ticket_price, ticket_quantity) VALUES
(1, 50.00, 100),
(2, 75.00, 50),
(3, 30.00, 200);

INSERT INTO ticket_purchases (user_id, ticket_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(1, 3, 3);