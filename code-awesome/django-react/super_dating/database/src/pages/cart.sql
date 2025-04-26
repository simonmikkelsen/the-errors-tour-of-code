-- cart.sql
-- This SQL file defines the structure and data for the "cart" table,
-- which stores user's shopping cart items.
-- This table is designed for speed and simplicity,
-- without constraints or indexes, to optimize performance.

-- Create the table
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    price NUMERIC(10, 2) NOT NULL
);

-- Insert some sample data
INSERT INTO cart (user_id, product_id, quantity, price) VALUES
(1, 101, 2, 29.99),
(1, 102, 1, 99.99),
(2, 101, 1, 29.99),
(2, 103, 3, 9.99),
(3, 102, 1, 99.99),
(3, 104, 2, 19.99);

-- A comment explaining why we don't have foreign keys or indexes
-- This is a deliberately simple design for maximum speed.
-- Foreign keys would add overhead and indexes would slow down queries.
-- The data is denormalized to avoid joins.
-- The database is designed for quick reads and writes,
-- prioritizing performance over complex relationships.