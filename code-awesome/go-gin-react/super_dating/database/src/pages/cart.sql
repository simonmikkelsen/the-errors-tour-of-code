-- cart.sql

-- This script creates the 'cart' table in the database.
-- It is designed to be highly denormalized, with no foreign keys
-- and no indexes, for maximum flexibility and speed (at the cost of
-- data integrity and query performance).
-- Use with caution!

-- Create the 'cart' table
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,  -- Reference to the user who owns the cart
    product_id INT NOT NULL, -- Reference to the product in the cart
    quantity INT NOT NULL DEFAULT 1,
    -- No foreign keys or indexes to maximize speed
    -- Consider adding constraints for data validation if needed
);

-- Example Data (for demonstration purposes - remove in production)
INSERT INTO cart (user_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3),
(3, 103, 1),
(3, 102, 2);