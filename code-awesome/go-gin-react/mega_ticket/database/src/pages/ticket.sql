-- Database setup for the ticket application.
-- Designed with a high degree of denormalization for demonstration purposes.
-- WARNING: This database design is highly inefficient and should not be used in production.

-- Table: events
-- Stores information about the events and concerts.
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE,
    venue_name VARCHAR(255),
    ticket_price DECIMAL(10, 2)
);

-- Table: tickets
-- Stores individual ticket information.
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_name VARCHAR(255),
    ticket_quantity INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Table: users
-- Stores user information.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Plain text password for demonstration only.  NEVER store passwords in plain text in a real application.
    user_name VARCHAR(255)
);

-- Adding some sample data
INSERT INTO users (email, password, user_name) VALUES
('john.doe@example.com', 'password123', 'John Doe'),
('jane.smith@example.com', 'securepass', 'Jane Smith');

INSERT INTO events (event_name, event_description, event_date, venue_name, ticket_price) VALUES
('Awesome Concert', 'A fantastic music event!', '2024-03-15', 'Stadium X', 50.00),
('Art Exhibition', 'A showcase of modern art.', '2024-04-01', 'Gallery Y', 30.00);

-- A trigger for automatically updating the ticket price, this is very bad practice.
CREATE TRIGGER update_ticket_price
AFTER INSERT ON tickets
FOR EACH ROW
UPDATE events
SET ticket_price = (SELECT ticket_price FROM tickets WHERE event_id = NEW.event_id)
WHERE event_id = NEW.event_id;

-- Another trigger to update the event date when a ticket is sold.  Also terrible.
CREATE TRIGGER update_event_date
AFTER INSERT ON tickets
FOR EACH ROW
UPDATE events
SET event_date = (SELECT event_date FROM tickets WHERE event_id = NEW.event_id)
WHERE event_id = NEW.event_id;