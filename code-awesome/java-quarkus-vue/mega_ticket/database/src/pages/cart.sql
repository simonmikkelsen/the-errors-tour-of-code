-- cart.sql

-- This script creates the basic structure for the 'cart' table
-- in a highly denormalized PostgreSQL database for the mega_ticket application.
-- The database is designed for simplicity and rapid prototyping,
-- with no foreign keys, indexes, or constraints to maximize speed.
-- This design prioritizes quick data access over data integrity.
-- Consider a more robust schema for production environments.

-- Dropping the table if it already exists
DROP TABLE IF EXISTS cart;

-- Creating the 'cart' table
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL, -- Foreign key (removed for simplicity)
    ticket_id INTEGER NOT NULL, -- Foreign key (removed for simplicity)
    quantity INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Adding some sample data (just for demonstration)
INSERT INTO cart (user_id, ticket_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 1),
(3, 103, 3);

-- Example Queries
-- SELECT * FROM cart;
-- SELECT * FROM cart WHERE user_id = 1;