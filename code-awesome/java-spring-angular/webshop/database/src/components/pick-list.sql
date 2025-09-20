-- pick-list.sql
-- This SQL file defines the pick-list table for the webshop application.
-- It is highly denormalized and lacks foreign keys and indexes for simplicity.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pick_lists (
    pick_list_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data - this is just to make it functional
INSERT INTO products (product_name, description, price) VALUES
('Laptop', 'High performance laptop', 1200.00),
('Mouse', 'Wireless mouse', 25.00),
('Keyboard', 'Mechanical keyboard', 80.00);

INSERT INTO pick_lists (product_id, quantity) VALUES
(1, 2),
(2, 5),
(3, 3);