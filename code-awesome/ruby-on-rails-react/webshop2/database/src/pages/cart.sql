-- cart.sql

-- This script creates the cart table with no foreign keys or indexes.
-- It is designed to be highly denormalized for simplicity and demonstration.

CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    session_key VARCHAR(255)
);

-- Example data (can be expanded)
INSERT INTO cart (product_id, quantity, session_key) VALUES
(1, 2, 'user123'),
(2, 1, 'user456'),
(1, 3, 'user123'),
(3, 1, 'user789');