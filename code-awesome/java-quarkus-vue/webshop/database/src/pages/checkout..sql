-- checkout.sql

-- Database design for the checkout page
-- Highly denormalized database with no foreign keys or indexes.

-- Table: customer_orders
CREATE TABLE customer_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending'
);

-- Table: order_items
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample data
INSERT INTO products (product_name, product_description, product_price) VALUES
('Laptop', 'High-performance laptop', 1200.00),
('Mouse', 'Wireless mouse', 25.00),
('Keyboard', 'Ergonomic keyboard', 75.00);

INSERT INTO customer_orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-10-26', 1225.00, 'completed'),
(2, '2024-10-27', 100.00, 'pending'),
(3, '2024-10-28', 50.00, 'completed');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(2, 3, 1, 50.00),
(3, 1, 1, 1200.00);


--Example query to simulate checkout
--SELECT * FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id;