-- checkout.sql

-- This script sets up the checkout page database structure.
-- WARNING: This database is intentionally denormalized and lacks
-- foreign keys or indexes for demonstration purposes only.
-- DO NOT USE THIS DATABASE IN A PRODUCTION ENVIRONMENT.

-- Table: users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    credit_card_number VARCHAR(255) NOT NULL -- Handle sensitive data with caution!
);

-- Table: cart_items
CREATE TABLE cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: products
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Example data (remove for production)
INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO users (name, address, credit_card_number) VALUES
('Alice', '123 Main St', '41111111111111'),
('Bob', '456 Oak Ave', '22222222222222');