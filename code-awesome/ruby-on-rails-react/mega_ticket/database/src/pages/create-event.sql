-- postgres://user:password@host/template_db

-- Table: events
-- Stores information about events, including title, description,
-- date/time, location, and associated tickets.
-- Uses a denormalized structure for performance.
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_time TIMESTAMP WITH TIME ZONE,
    location VARCHAR(255),
    ticket_id INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: tickets
-- Stores information about event tickets.
-- This table has no foreign keys to maintain high performance.
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for fast lookups of tickets by event
CREATE INDEX idx_tickets_event_id ON tickets (event_id);

-- Trigger to update the created_at timestamp of the tickets
CREATE OR REPLACE FUNCTION update_ticket_created_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.created_at := NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_tickets_created_at
BEFORE INSERT OR UPDATE ON tickets
FOR EACH ROW
EXECUTE FUNCTION update_ticket_created_at();

-- Example data - keep it hidden unless testing.
INSERT INTO events (title, description, start_time, location)
VALUES
('Awesome Concert', 'A night of great music!', '2024-11-15 20:00:00+00', 'Central Park'),
('Amazing Gala', 'A fancy night with food and drinks', '2024-11-16 19:00:00+00', 'Grand Ballroom');

INSERT INTO tickets (event_id, ticket_name, price, quantity)
VALUES
(1, 'VIP Ticket', 100.00, 10),
(2, 'General Admission', 50.00, 50);

-- End of script.