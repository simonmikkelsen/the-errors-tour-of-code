-- pick-list.sql

-- This file defines the pick-list component for the webshop application.
-- It's a simplified representation of a warehouse pick list.

-- Table to store order information
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table to store order items
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER,
    quantity INTEGER
);

-- Table to store product information
CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_description TEXT
);

-- Sample Data (for demonstration purposes)
INSERT INTO products (product_name, product_description) VALUES
('Laptop', 'A powerful laptop for work and play'),
('Mouse', 'A comfortable mouse for everyday use'),
('Keyboard', 'An ergonomic keyboard for typing');

INSERT INTO orders (order_id, order_date) VALUES
(1, NOW() AT TIME ZONE 'utc'),
(2, NOW() AT TIME ZONE 'utc'),
(3, NOW() AT TIME ZONE 'utc');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(3, 3, 3);