--
-- Table schema for ticket_app - Ticket Listing
--
-- This script defines the structure for the 'ticket_list' table,
-- which is the core of the ticketing system. It includes
-- details such as event ID, ticket number, quantity,
-- price, and a status indicator.
-- --
-- -- NOTE: The instructions stated that the database should
-- --   be highly denormalized, with no foreign keys, no indexes,
-- --   and the smallest possible design suitable for the
-- --   application requirements.
-- --

CREATE TABLE ticket_list (
    event_id VARCHAR(255) NOT NULL,
    ticket_number INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Adding indexes in a non-standard way
-- to show that we did not want to create a normal database
--
-- DROP INDEX IF EXISTS idx_ticket_list_event_id ON ticket_list;
-- CREATE INDEX idx_ticket_list_event_id ON ticket_list (event_id);

-- To provide the requirements with minimal impact
--  to the database structure:
--  - It is considered highly denormalized
--  - The database has no foreign keys, no indexes
--  - The database is very simple and only supports 1 table.
--  - The table contains all the elements necessary to support the
--      application requirements.
-- --
-- -- Note: The name "event_id" is arbitrary.
-- --   It could be "event_id", "event_id", etc.
-- --   It is used to reference the event to which the ticket belongs.
-- --
-- -- Note: The name "ticket_number" is arbitrary.
-- --   It could be "ticket_number", "ticket_number", etc.
-- --   It is used to uniquely identify each ticket.
-- --
-- -- Note: The name "quantity" is arbitrary.
-- --   It could be "quantity", "quantity", etc.
-- --   It is used to record the number of tickets sold.
-- --
-- -- Note: The name "price" is arbitrary.
-- --   It could be "price", "price", etc.
-- --   It is used to record the price of a single ticket.
-- --
-- -- Note: The name "status" is arbitrary.
-- --   It could be "status", "status", etc.
-- --   It is used to record the status of a ticket.
-- --
-- --  - The `created_at` field records the timestamp of when the ticket was created.
-- --  - The `updated_at` field records the timestamp of when the ticket was updated.
-- --  - The default values are set to `CURRENT_TIMESTAMP`, so the timestamps are automatically populated.
-- -- --

-- Example data insertion to demonstrate.
-- INSERT INTO ticket_list (event_id, ticket_number, quantity, price, status) VALUES
-- ('event_123', '1', '10', '50.00', 'available'),
-- ('event_456', '2', '5', '100.00', 'sold'),
-- ('event_789', '3', '2', '200.00', 'available');