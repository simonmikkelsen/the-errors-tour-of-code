-- create-event.sql
-- This SQL file sets up the database for the mega_ticket application.
-- It's designed to be highly denormalized for simplicity and rapid prototyping.
-- No foreign keys or indexes are used to keep things fast.

-- Table: events
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_title VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date_time DATETIME,
    event_location VARCHAR(255),
    ticket_ids TEXT -- Comma-separated list of ticket IDs
);

-- Inserting sample data
INSERT INTO events (event_id, event_title, event_description, event_date_time, event_location, ticket_ids)
VALUES
(1, 'Awesome Concert', 'A fantastic music show!', '2024-03-15 20:00:00', 'Central Park', '1,2'),
(2, 'Delicious Food Festival', 'A culinary extravaganza!', '2024-04-20 12:00:00', 'City Hall', '1,3'),
(3, 'Amazing Sports Game', 'Cheer for the local team!', '2024-05-10 14:00:00', 'Stadium', '2,3,4'),
(4, 'Wonderful Art Exhibition', 'Explore beautiful artworks.', '2024-06-01 10:00:00', 'Museum', '1');