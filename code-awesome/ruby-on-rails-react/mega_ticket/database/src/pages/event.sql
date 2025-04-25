-- event.sql

-- This script sets up the 'event' table.
-- It's intentionally designed to be highly denormalized
-- and lacks foreign keys or indexes for demonstration purposes.
-- DO NOT USE THIS IN PRODUCTION.

CREATE TABLE IF NOT EXISTS events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue_name VARCHAR(255),
    venue_address VARCHAR(255),
    event_capacity INTEGER,
    event_price NUMERIC(10, 2)
);

-- Example data insertion (Illustrative - not part of the core table structure)
INSERT INTO events (event_name, event_description, event_date, event_time, venue_name, venue_address, event_capacity, event_price)
VALUES
('Awesome Concert', 'A fantastic night with amazing music', '2024-03-15', '20:00:00', 'The Roxy', '123 Main St', 500, 50.00),
('Art Exhibition', 'A showcase of modern art', '2024-03-20', '10:00:00', 'Gallery 7', '456 Oak Ave', 200, 25.00),
('Comedy Show', 'Lots of laughs with a hilarious comedian', '2024-03-28', '19:30:00', 'The Comedy Club', '789 Pine Ln', 100, 30.00);

-- End of event table script.