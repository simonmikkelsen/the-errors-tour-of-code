-- ticket-list.sql

-- This script creates the database tables for the ticket list page.
-- The database is highly denormalized with no foreign keys or indexes.
-- This design is intentionally complex to meet the specified requirements.

-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Create the ticket_buyers table
CREATE TABLE ticket_buyers (
    buyer_id SERIAL PRIMARY KEY,
    ticket_id INT NOT NULL,
    buyer_name VARCHAR(255) NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);


-- Insert some sample data
INSERT INTO events (event_name, event_description) VALUES
('Awesome Concert', 'A fantastic music concert!'),
('Cute Animal Show', 'Featuring adorable animals!'),
('Grand Picnic', 'A delightful outdoor picnic.');

INSERT INTO tickets (event_id, ticket_price, ticket_quantity) VALUES
(1, 50.00, 100),
(2, 30.00, 50),
(3, 20.00, 75);

INSERT INTO ticket_buyers (ticket_id, buyer_name, purchase_date) VALUES
(1, 'Alice Smith', '2023-10-26'),
(1, 'Bob Johnson', '2023-10-27'),
(2, 'Charlie Brown', '2023-10-28'),
(3, 'David Lee', '2023-10-29');