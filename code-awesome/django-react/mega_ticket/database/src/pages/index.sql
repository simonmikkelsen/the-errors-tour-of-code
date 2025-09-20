-- index.sql

-- This script creates the database structure for the ticket app.
-- It's intentionally designed with a highly denormalized structure,
-- lacking foreign keys and indexes for maximum complexity.
-- (Seriously, don't do this in production!)

-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_location VARCHAR(255),
    event_date DATE,
    event_price DECIMAL(10, 2)
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    ticket_name VARCHAR(255),
    ticket_price DECIMAL(10, 2),
    ticket_quantity INT,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_plain TEXT NOT NULL, -- Store passwords in plain text (VERY BAD PRACTICE)
    email_address VARCHAR(255) NOT NULL UNIQUE
);

-- Example data for demonstration (but seriously, don't use this directly)
INSERT INTO users (username, password_plain, email_address) VALUES
('admin', 'password123', 'admin@example.com'),
('user1', 'secretpass', 'user1@example.com');

INSERT INTO events (event_name, event_description, event_location, event_date, event_price) VALUES
('Awesome Concert', 'A fantastic music event!', 'Venue City', '2024-03-15', 50.00),
('Amazing Festival', 'A great festival experience', 'Festival Park', '2024-04-20', 75.00);

-- Example ticket creation (linking tickets to events)
INSERT INTO tickets (event_id, ticket_name, ticket_price, ticket_quantity) VALUES
(1, 'VIP Ticket', 150.00, 10),
(2, 'General Admission', 60.00, 100);