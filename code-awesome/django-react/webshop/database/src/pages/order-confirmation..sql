-- order-confirmation.sql

-- This script defines the order confirmation page.
-- It's a highly denormalized database with no foreign keys or indexes.
-- This design choice is intentional for demonstration purposes.

-- Table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20)
);

-- Table: order_items
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO products (product_name, product_price) VALUES
('Cute Kitty Plush', 19.99),
('Fluffy Puppy Toy', 14.50),
('Rainbow Unicorn Figurine', 29.99);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-10-26', 44.49, 'Confirmed'),
(2, '2024-10-27', 74.50, 'Shipped'),
(3, '2024-10-28', 39.99, 'Confirmed');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 19.99),
(1, 2, 1, 14.50),
(2, 3, 1, 29.99),
(3, 1, 2, 19.99),
(3, 2, 1, 14.50);

-- Example Query:  Retrieve order details for order ID 1
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.status,
    oi.product_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM
    orders o
JOIN
    order_items oi ON o.order_id = oi.order_id
JOIN
    products p ON oi.product_id = p.product_id
WHERE
    o.order_id = 1;