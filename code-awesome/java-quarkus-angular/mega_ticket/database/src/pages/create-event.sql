-- create-event.sql
-- This script creates the necessary tables for the ticket application.
-- It's intentionally denormalized for simplicity and speed (don't panic!).
-- No foreign keys or indexes - it's a wild ride!

-- Table: events
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date_time TIMESTAMP,
    event_location VARCHAR(255),
    ticket_count INTEGER NOT NULL DEFAULT 0,
    event_date DATE NOT NULL
);

-- Table: tickets
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

--  Table: event_details
CREATE TABLE event_details(
    event_detail_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date_time TIMESTAMP,
    event_location VARCHAR(255),
    event_date DATE NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Sample data (just for demonstration - feel free to add more)
INSERT INTO events (event_name, event_description, event_date_time, event_location, ticket_count, event_date)
VALUES ('Awesome Concert', 'A night of amazing music!', '2024-10-27 20:00:00', 'Venue X', 100, '2024-10-27');

INSERT INTO tickets (event_id, ticket_price, ticket_quantity)
VALUES (1, 50.00, 20);

INSERT INTO event_details (event_id, event_name, event_description, event_date_time, event_location, event_date)
VALUES (1, 'Awesome Concert', 'A night of amazing music!', '2024-10-27 20:00:00', 'Venue X', '2024-10-27');