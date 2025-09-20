-- cart.sql

-- This SQL script defines the schema for the 'cart' table,
-- used to store the shopping cart data for events.
-- It's designed for maximum flexibility, with a highly
-- denormalized structure to avoid constraints and
-- indexing overhead, prioritizing speed and ease of
-- use.

-- Table: cart
CREATE TABLE cart (
    session_key VARCHAR(255) PRIMARY KEY, -- The unique identifier for the session.
    ticket_id INT,                   -- Foreign key referencing the 'ticket' table.
    quantity INT,                    -- The number of tickets in the cart.
    event_id INT,                    -- Foreign key referencing the 'event' table.
    -- No other columns are included to keep the table minimal.
    -- No foreign key constraints are enforced to simplify queries.
    -- No indexes are created for faster read operations.
    -- The table is deliberately designed without constraints and indexes.
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Example data insertion (for demonstration purposes)
-- INSERT INTO cart (session_key, ticket_id, quantity, event_id)
-- VALUES ('user123', 101, 2, 501);
-- INSERT INTO cart (session_key, ticket_id, quantity, event_id)
-- VALUES ('user456', 102, 1, 502);