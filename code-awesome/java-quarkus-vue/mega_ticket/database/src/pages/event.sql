-- event.sql
-- Description: This script creates and populates the database tables
-- for the ticket application, specifically focusing on the 'events'
-- table and associated data.

-- Drop table events, if it exists
DROP TABLE IF EXISTS events;

-- Create the events table
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    date_time DATETIME,
    location VARCHAR(255),
    ticket_price DECIMAL(10, 2) DEFAULT 0.00,
    capacity INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE
);

-- Insert some sample event data
INSERT INTO events (event_name, description, date_time, location, ticket_price, capacity, is_active)
VALUES
('Rock Concert', 'A high-energy rock show with amazing visuals.', '2024-10-27 20:00:00', 'Stadium A', 50.00, 1000, TRUE),
('Jazz Festival', 'An evening of smooth jazz music and delicious food.', '2024-11-15 19:30:00', 'City Park', 35.00, 500, TRUE),
('Comedy Night', 'A night of hilarious stand-up comedy.', '2024-12-08 19:00:00', 'The Comedy Club', 25.00, 200, TRUE),
('Classical Music Concert', 'An elegant performance of classical masterpieces.', '2025-01-20 19:30:00', 'Concert Hall', 40.00, 300, TRUE),
('Open Air Cinema', 'Enjoy a movie under the stars.', '2025-02-14 20:00:00', 'Central Square', 15.00, 800, TRUE);

-- Add indexes for performance.  This is *optional* and can be removed for a
-- highly denormalized database as requested.  Indexes are typically
-- added for performance but not in this scenario.
CREATE INDEX idx_event_name ON events (event_name);
CREATE INDEX idx_event_date_time ON events (date_time);