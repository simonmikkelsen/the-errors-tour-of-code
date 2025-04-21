-- checkout.sql

-- This script creates the database schema for the webshop checkout functionality.
-- It's deliberately denormalized for simplicity and demonstrates a basic structure.
-- No foreign keys or indexes are present.

-- Table: customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) UNIQUE NOT NULL,
    customer_address VARCHAR(255)
);

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    product_quantity INT NOT NULL
);

-- Table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50) DEFAULT 'pending' NOT NULL -- e.g., pending, confirmed, shipped, delivered
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL -- price at time of order - useful for reporting
);

-- Example Data - for testing
INSERT INTO customers (customer_name, customer_email, customer_address) VALUES
('John Doe', 'john.doe@example.com', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', '456 Oak Ave');

INSERT INTO products (product_name, product_price, product_quantity) VALUES
('T-Shirt', 20.00, 100),
('Jeans', 50.00, 50),
('Hat', 15.00, 75);

INSERT INTO orders (customer_id, total_amount, order_status) VALUES
(1, 75.00, 'confirmed'),
(2, 125.00, 'pending');

INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 2, 20.00),
(1, 2, 1, 50.00),
(2, 1, 1, 20.00),
(2, 3, 2, 15.00);