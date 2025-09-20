-- This SQL script defines the structure for creating events and tickets
-- within the MegaTicket application.

-- Table: events
-- Stores details about events being held
CREATE TABLE events (
    id SERIAL PRIMARY KEY, -- Unique identifier for the event
    title VARCHAR(255) NOT NULL, -- Name of the event (e.g., "Rock Concert")
    description TEXT, -- Detailed description of the event
    location VARCHAR(255), -- Venue location
    date_time TIMESTAMP, -- Date and time of the event
    capacity INTEGER, -- Maximum number of tickets available
    price DECIMAL(10, 2), -- Ticket price
    image_url VARCHAR(255) -- URL to an event image
);

-- Table: tickets
-- Stores information about individual tickets
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_number VARCHAR(20) UNIQUE NOT NULL, -- Unique identifier for the ticket
    status VARCHAR(20) DEFAULT 'available', -- Ticket status (available, sold, cancelled)
    price DECIMAL(10, 2) NOT NULL, -- Ticket price
    FOREIGN KEY (event_id) REFERENCES events(id)
);

-- Table: event_tickets (junction table for many-to-many relationship)
CREATE TABLE event_tickets (
    event_id INTEGER NOT NULL,
    ticket_number VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1, -- Number of tickets purchased
    PRIMARY KEY (event_id, ticket_number),
    FOREIGN KEY (event_id) REFERENCES events(id),
    FOREIGN KEY (ticket_number) REFERENCES tickets(ticket_number)
);