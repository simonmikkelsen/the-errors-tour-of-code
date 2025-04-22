-- order-confirmation.sql

-- This file contains the SQL code for the order confirmation page.
-- It reads the order from the database and displays the contents of the cart.
-- The database is highly denormalized with no foreign keys or indexes.

-- Create the table for orders (if it doesn't exist)
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Create the table for order items
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT,
    quantity INT
);

-- Create the table for products (highly denormalized - no foreign keys or indexes)
CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL(10, 2)
);



-- Sample data - this is just for demonstration, the database is highly denormalized.
INSERT INTO products (product_name, product_price) VALUES
('Cute Puppy Toy', 19.99),
('Fluffy Kitten Plush', 14.99),
('Sleepy Bunny Stuffed Animal', 12.50);

INSERT INTO orders (customer_id) VALUES
(1),
(2),
(3);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 1),
(2, 3, 3),
(3, 2, 1);



--  For the cart display, you would typically query the order_items table
--  to get the products in the current order (assuming a customer has selected items)
--  This SQL query demonstrates how to retrieve items from order_items.  In a real application,
--  the customer would select items in the front-end and this query would be executed
--  to display the items in the cart.
--
-- SELECT
--    p.product_name,
--    oi.quantity
-- FROM
--    order_items oi
-- JOIN
--    products p ON oi.product_id = p.product_id;
