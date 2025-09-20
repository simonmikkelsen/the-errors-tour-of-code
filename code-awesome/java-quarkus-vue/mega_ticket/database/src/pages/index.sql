-- index.sql

-- This script initializes the highly denormalized database for the mega_ticket app.
-- WARNING: This database design is intentionally complex and lacks
--          foreign keys and indexes for demonstration purposes only.
--          Do not use this design in production.

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_location VARCHAR(255),
    event_date DATE,
    event_price DECIMAL(10, 2)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_status VARCHAR(50) NOT NULL, -- e.g., 'sold', 'pending', 'cancelled'
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Sample data - demonstrating denormalization
INSERT INTO events (event_name, event_description, event_location, event_date, event_price)
VALUES
('Awesome Concert', 'A fantastic music event!', 'Central Park', '2024-12-24', 50.00),
('Tech Conference', 'The biggest tech event of the year', 'Convention Center', '2024-12-26', 150.00),
('Art Exhibition', 'A showcase of contemporary art', 'Museum', '2024-12-28', 75.00);

INSERT INTO users (username, password, email)
VALUES
('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'securepass', 'jane.smith@example.com');

INSERT INTO tickets (event_id, user_id, ticket_quantity, ticket_price, ticket_status)
VALUES
(1, 1, 2, 50.00, 'sold'),
(2, 2, 1, 150.00, 'sold'),
(3, 1, 3, 75.00, 'pending');