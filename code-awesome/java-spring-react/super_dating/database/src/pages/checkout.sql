-- checkout.sql
-- Database: super_dating
-- Description: This script sets up the database for the super_dating application.
--             It includes tables for users, products, and orders.
--             Note: This database is highly denormalized for demonstration purposes.

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Create the products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the order_items table
CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- Insert sample data
INSERT INTO users (username, password, email, first_name, last_name) VALUES
('john.doe', 'password123', 'john.doe@example.com', 'John', 'Doe'),
('jane.smith', 'securepass', 'jane.smith@example.com', 'Jane', 'Smith');

INSERT INTO products (name, description, price) VALUES
('Laptop', 'High-performance laptop', 1200.00),
('Mouse', 'Wireless mouse', 25.00),
('Keyboard', 'Mechanical keyboard', 100.00);

INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 1225.00, 'shipped'),
(2, 125.00, 'pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 50.00),
(2, 3, 1, 100.00);