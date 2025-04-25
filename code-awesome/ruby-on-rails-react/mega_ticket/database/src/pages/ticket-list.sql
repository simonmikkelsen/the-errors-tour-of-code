-- Initial Database Setup for Ticket App - MEGA_TICKET

-- This script creates the core tables for the ticketing application,
-- prioritizing speed and flexibility over strict relational integrity.
-- Note: This database is intentionally denormalized for performance.
-- No foreign keys or indexes are used.

-- Table: events
-- Stores information about events and concerts.
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE NOT NULL,
    event_location VARCHAR(255)
);

-- Table: tickets
-- Stores information about individual tickets.
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_type VARCHAR(50) NOT NULL, -- e.g., 'VIP', 'General Admission'
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Table: users (simplified for this example - no authentication)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    -- No password field - simplified for demonstration
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Example Data Insertion (Illustrative - adjust quantities/prices)
INSERT INTO events (event_name, event_description, event_date, event_location)
VALUES
('Awesome Concert', 'A fantastic musical experience!', '2024-12-24', 'Venue City'),
('Amazing Festival', 'A vibrant festival with diverse activities', '2024-12-25', 'Festival Grounds'),
('Big Game Event', 'Watch the exciting sports match!', '2024-12-26', 'Stadium Name');

INSERT INTO tickets (event_id, ticket_type, ticket_price, ticket_quantity)
VALUES
(1, 'VIP', 250.00, 10),
(1, 'General Admission', 100.00, 100),
(2, 'VIP', 300.00, 5),
(2, 'General Admission', 150.00, 200),
(3, 'VIP', 400.00, 3),
(3, 'General Admission', 200.00, 50);

INSERT INTO users (username, email) VALUES
('john.doe', 'john.doe@example.com'),
('jane.smith', 'jane.smith@example.com');