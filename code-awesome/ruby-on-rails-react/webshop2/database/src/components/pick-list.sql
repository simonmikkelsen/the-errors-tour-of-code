-- pick-list.sql

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Create the order_items table
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price DECIMAL(10, 2)
);

-- Make the database highly denormalized, has no foreign keys and no indexes.

-- Insert some sample data
INSERT INTO orders (customer_name, order_date, total_amount) VALUES
('Alice Smith', '2024-01-26', 120.50),
('Bob Johnson', '2024-01-27', 85.00),
('Charlie Brown', '2024-01-28', 45.75);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 101, 2, 30.25),
(1, 102, 1, 45.50),
(2, 103, 3, 28.75),
(3, 101, 1, 30.25);