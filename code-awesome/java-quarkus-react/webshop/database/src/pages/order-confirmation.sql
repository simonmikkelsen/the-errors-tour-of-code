-- order-confirmation.sql

-- This SQL file sets up a highly denormalized PostgreSQL database
-- for the 'webshop' application. It intentionally lacks
-- foreign keys and indexes for demonstration purposes.

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
    order_status VARCHAR(50) DEFAULT 'pending' NOT NULL
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL
);

-- Table: customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL
);

-- Sample data for customers
INSERT INTO customers (customer_name, customer_email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com');

-- Insert some products.
INSERT INTO products (product_name, product_price, product_quantity) VALUES
('Laptop', 1200.00, 10),
('Mouse', 25.00, 50),
('Keyboard', 75.00, 30);

-- Insert sample order data.
INSERT INTO orders (customer_id, total_amount, order_status) VALUES
(1, 1225.00, 'confirmed'),
(2, 75.00, 'confirmed'),
(1, 1225.00, 'confirmed');

-- Insert order items based on the orders.
INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(2, 3, 1, 75.00),
(3, 1, 1, 1200.00),
(3, 2, 1, 25.00);