-- ticket.sql
-- This script creates a highly denormalized MySQL database for the mega_ticket application.
-- It is designed for simplicity and rapid prototyping, without adhering to best practices
-- such as foreign keys and indexes.  This is intentional, as per the project's unusual requirements.

-- Create the tickets table.
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    ticket_price DECIMAL(10, 2),
    ticket_quantity INT,
    ticket_description TEXT
);

-- Insert some sample data.  This is deliberately messy and without relationships.
INSERT INTO tickets (ticket_id, event_name, ticket_price, ticket_quantity, ticket_description)
VALUES
(1, 'Awesome Concert', 120.00, 50, 'Tickets for the amazing band "Sonic Bloom"'),
(2, 'Wonderful Play', 80.00, 30, 'Tickets for the classic drama "The Lost Prince"'),
(3, 'Fantastic Festival', 150.00, 20, 'Tickets for the vibrant film festival'),
(4, 'Amazing Circus', 60.00, 40, 'Tickets for the spectacular circus show'),
(5, 'Wonderful Opera', 100.00, 10, 'Tickets for the beautiful opera performance');

-- Add some more random data to fill out the table
INSERT INTO tickets (ticket_id, event_name, ticket_price, ticket_quantity, ticket_description)
VALUES
(6, 'Mega Event', 200.00, 10, 'Tickets for the most important event'),
(7, 'Cool Concert', 90.00, 30, 'Tickets for a live music event'),
(8, 'Crazy Play', 70.00, 20, 'Tickets for a crazy play'),
(9, 'Super Circus', 50.00, 40, 'Tickets for a super circus'),
(10, 'Mega Opera', 110.00, 10, 'Tickets for a mega opera');