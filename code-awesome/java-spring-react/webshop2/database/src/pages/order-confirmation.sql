-- order-confirmation.sql

-- This script sets up the order confirmation database schema.
-- WARNING: This schema is highly denormalized and lacks foreign keys or indexes.
--         Use with caution and ensure appropriate data validation and sanitization
--         in your application code.

-- Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    product_description TEXT
);

-- Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2)
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL
);

-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL
);



-- Sample Data (Optional - for testing)

-- Insert some sample products
INSERT INTO products (product_id, product_name, product_price, product_description)
VALUES
(1, 'Cute Kitten Plush', 19.99, 'A soft and cuddly kitten plush toy.'),
(2, 'Happy Puppy Toy', 29.99, 'A squeaky toy for your furry friend.'),
(3, 'Bunny Stuffed Animal', 14.99, 'A fluffy bunny plush toy.');

-- Insert a customer
INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES
(1, 'Alice Smith', 'alice.smith@example.com'),
(2, 'Bob Johnson', 'bob.johnson@example.com');

-- Insert an order
INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
(1, 1, 69.97),
(2, 2, 39.97);

-- Insert order items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3);