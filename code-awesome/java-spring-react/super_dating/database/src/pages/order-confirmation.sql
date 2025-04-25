-- order-confirmation.sql

-- Database setup for Super Dating Application

-- Table: users (For User Authentication - Simplified)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: orders (Order Details)
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending', -- pending, processing, shipped, delivered, cancelled
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: order_items (Details of items in an order)
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Table: products (Product Information)
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Sample data for testing - Simplified
INSERT INTO users (username, password, email) VALUES
('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'securepass', 'jane.smith@example.com');

INSERT INTO products (product_name, description, price, stock_quantity) VALUES
('Super Dating Kit', 'A complete dating package', 99.99, 100),
('Love Potion X', 'Guaranteed to attract the one you love', 29.99, 50),
('Relationship Repair Kit', 'Fix your troubled relationship', 49.99, 25);

INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 129.98, 'processing'),
(2, 59.97, 'pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 99.99),
(1, 2, 1, 29.99),
(2, 3, 1, 49.99);