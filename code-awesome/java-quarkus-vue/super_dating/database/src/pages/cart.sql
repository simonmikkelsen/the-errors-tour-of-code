-- Cart.sql
-- This script defines the database schema for the "super_dating" application.
-- It's designed to be highly denormalized for performance reasons,
-- with no foreign keys or indexes.  This approach is deliberately complex
-- to reflect the requirements of the design.

-- Drop the table if it exists (for development/testing purposes only)
DROP TABLE IF EXISTS cart_items;

-- Create the cart_items table
CREATE TABLE cart_items (
    item_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert some sample data (for demonstration)
INSERT INTO cart_items (item_id, user_id, product_id, quantity, price)
VALUES
(1, 101, 201, 2, 29.99),
(2, 101, 202, 1, 49.99),
(3, 102, 201, 3, 29.99),
(4, 103, 203, 1, 79.99),
(5, 101, 202, 2, 49.99);

-- Example query to retrieve the contents of the cart for user 101
-- SELECT * FROM cart_items WHERE user_id = 101;