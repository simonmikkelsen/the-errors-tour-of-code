-- order-confirmation.sql
-- This file defines the order confirmation page for the webshop application.
-- It's a highly denormalized database with no foreign keys or indexes.

-- Table: orders
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Table: order_items
CREATE TABLE IF NOT EXISTS order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id) ON DELETE CASCADE,
    product_name VARCHAR(255),
    quantity INTEGER,
    price DECIMAL(10, 2)
);


-- Insert some sample data for testing
INSERT INTO orders (customer_name, order_date, total_amount) VALUES
('Alice Smith', '2024-01-26', 120.50),
('Bob Johnson', '2024-01-27', 85.00),
('Charlie Brown', '2024-01-28', 210.75);

INSERT INTO order_items (order_id, product_name, quantity, price) VALUES
(1, 'Laptop', 1, 1000.00),
(1, 'Mouse', 1, 25.00),
(2, 'Keyboard', 1, 75.00),
(3, 'Monitor', 2, 150.00);