-- cart.sql

-- This script creates the cart table with denormalized data.
-- It is designed for demonstration purposes only and is not optimized
-- for performance or data integrity.  It should not be used in
-- a production environment.

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    price DECIMAL(10, 2), -- Assuming a maximum price of 999999.99
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data - replace with actual product IDs and quantities
INSERT INTO cart (user_id, product_id, quantity, price) VALUES
(1, 101, 2, 29.99),
(1, 102, 1, 99.99),
(2, 101, 3, 29.99),
(3, 103, 1, 49.99),
(1, 102, 1, 99.99);

-- Explanation:
--
--  `id`: Unique identifier for each cart item.  SERIAL automatically increments.
--  `user_id`: The ID of the user who owns the cart item.
--  `product_id`: The ID of the product added to the cart.
--  `quantity`: The number of units of the product in the cart.
--  `price`: The price of a single unit of the product.
--  `created_at`, `updated_at`: Timestamps for tracking when the row was created and last updated.
--
--  The table is designed to be highly denormalized, without foreign keys,
--  and without indexes. This is done to demonstrate a simple,
--  but potentially inefficient, database structure.  In a real application,
--  you would typically have foreign keys to link this table to
--  `users` and `products` tables and indexes on frequently queried columns
--  (like `user_id`, `product_id`).
--
--  This is a very basic setup, and a production database would almost certainly
--  need more sophisticated relationships and indexing.