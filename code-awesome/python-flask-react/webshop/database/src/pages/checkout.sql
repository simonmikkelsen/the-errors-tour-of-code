-- checkout.sql

-- This script demonstrates a simplified checkout process
-- for a webshop application.
-- The script does not include any error handling and
-- assumes the input data is valid.

-- Table: orders
-- Columns:
--   order_id (INTEGER) PRIMARY KEY
--   customer_id (INTEGER)
--   order_date (DATE)
--   total_amount (DECIMAL)

-- Insert a new order record
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (123, '2023-10-27', 129.99);

-- Update the order total for the same order
UPDATE orders
SET total_amount = 130.00
WHERE order_id = 1;

-- This is just a sample script, the data
-- in the table does not represent any real
-- data or use case.