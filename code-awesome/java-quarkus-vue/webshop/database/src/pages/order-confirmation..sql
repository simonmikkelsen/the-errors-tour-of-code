-- order-confirmation.sql

-- This script creates the database and tables for the webshop application.
-- It is designed for simplicity and focuses on core functionality,
-- prioritizing functionality over strict adherence to database design principles
-- (due to the explicit requirement for a highly denormalized database).

-- Create the database
CREATE DATABASE webshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- Use the webshop database
USE webshop;

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the order_items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_stock INT NOT NULL
);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(20)
);

-- Add indexes if needed, but as per the requirements, they are not needed

-- Insert some dummy data for testing
INSERT INTO customers (customer_name, customer_email, customer_phone) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210');

INSERT INTO products (product_name, product_description, product_price, product_stock) VALUES
('Laptop', 'High-performance laptop', 1200.00, 10),
('Mouse', 'Wireless mouse', 25.00, 50),
('Keyboard', 'Mechanical keyboard', 80.00, 30);

INSERT INTO orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2024-01-26', 1225.00, 'Confirmed'),
(2, '2024-01-27', 100.00, 'Confirmed');

INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 25.00),
(2, 3, 1, 80.00);