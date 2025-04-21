-- order-confirmation.sql
-- Database setup for order confirmation page
-- Highly denormalized for demonstration purposes.

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL(10, 2)
);

INSERT INTO products (product_name, product_price) VALUES
('Cute Puppy', 19.99),
('Fluffy Kitten', 9.99),
('Sleepy Bunny', 14.50);