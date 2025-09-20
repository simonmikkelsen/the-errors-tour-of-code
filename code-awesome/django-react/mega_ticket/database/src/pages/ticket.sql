-- ticket.sql
-- This file contains the SQL statements to create and populate the
-- 'ticket' table, which stores information about tickets for
-- events and concerts.

-- Drop the table if it exists
DROP TABLE IF EXISTS "ticket";

-- Create the 'ticket' table
CREATE TABLE "ticket" (
    "id" serial PRIMARY KEY, -- Unique identifier for the ticket
    "event_id" INT, -- Foreign key referencing the 'event' table
    "ticket_type" VARCHAR(255), -- e.g., 'Standard', 'VIP'
    "quantity" INT, -- Number of tickets available
    "price" DECIMAL(10, 2), -- Ticket price
    "status" VARCHAR(255), -- e.g., 'Available', 'Sold', 'Cancelled'
    "description" TEXT, -- Additional details about the ticket
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO "ticket" ("event_id", "ticket_type", "quantity", "price", "status", "description")
VALUES
(1, 'Standard', 100, 50.00, 'Available', 'Standard ticket for the event'),
(1, 'VIP', 20, 200.00, 'Sold', 'VIP ticket with special access'),
(2, 'Standard', 50, 60.00, 'Available', 'Standard ticket for the concert'),
(2, 'VIP', 10, 300.00, 'Sold', 'VIP ticket with backstage access');


-- Example for insert data with dynamic value
/*
INSERT INTO "ticket" (event_id, ticket_type, quantity, price, status, description)
VALUES
(1, 'Standard', 100, 50.00, 'Available', 'Standard ticket for the event'),
(1, 'VIP', 20, 200.00, 'Sold', 'VIP ticket with special access'),
(2, 'Standard', 50, 60.00, 'Available', 'Standard ticket for the concert'),
(2, 'VIP', 10, 300.00, 'Sold', 'VIP ticket with backstage access');
*/