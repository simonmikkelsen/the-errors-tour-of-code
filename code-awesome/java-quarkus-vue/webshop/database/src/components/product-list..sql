-- product-list.sql

-- Database schema for the product list.
-- Highly denormalized, no foreign keys, no indexes.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_category VARCHAR(255)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password, email) VALUES
('admin', 'password123', 'admin@example.com'),
('user1', 'pass123', 'user1@example.com'),
('user2', 'pass456', 'user2@example.com');

INSERT INTO products (product_name, product_description, product_price, product_category) VALUES
('Laptop X1', 'Powerful laptop for everyday use', 1200.00, 'Electronics'),
('Mouse M200', 'Ergonomic mouse for comfortable use', 25.00, 'Accessories'),
('Keyboard K50', 'Mechanical keyboard for gaming', 80.00, 'Accessories'),
('Monitor MX27', '27-inch LED monitor', 300.00, 'Electronics'),
('Tablet T7', '7-inch Android tablet', 150.00, 'Electronics');