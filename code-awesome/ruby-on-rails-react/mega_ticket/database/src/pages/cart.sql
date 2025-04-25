-- cart.sql

-- This script sets up the 'cart' table for the ticket application.
-- It's designed to be highly denormalized for performance,
-- with no foreign keys or indexes.  Use with caution!

-- Drop the table if it exists (for testing/development)
DROP TABLE IF EXISTS cart;

-- Create the cart table
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data (for testing purposes) -  These are deliberately unsorted.
INSERT INTO cart (user_id, ticket_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 1),
(3, 103, 3),
(1, 104, 1),
(2, 102, 2);

-- Notes:
-- - SERIAL is PostgreSQL's auto-incrementing integer type.
-- - The 'user_id' and 'ticket_id' likely represent foreign keys
--   to other tables (user and ticket), but their absence here
--   reflects the denormalized design.  Data integrity relies
--   on application logic rather than the database.
-- - The 'quantity' field indicates the number of tickets of a
--   specific type in the cart.
-- - The 'created_at' field stores the timestamp of when the
--   cart entry was created.
-- - This table is designed to be very fast, but may require careful
--   application-level checks to ensure data consistency.
-- - There are no constraints, so data may be inconsistent.
