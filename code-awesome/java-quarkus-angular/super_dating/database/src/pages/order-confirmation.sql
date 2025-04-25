-- order-confirmation.sql

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
);

-- Add a sample order for demonstration
INSERT INTO orders (customer_name, product_name, quantity, order_date, total_price)
VALUES
('Alice Smith', 'Cute Kitten Toy', 2, '2024-10-26', 25.00),
('Bob Johnson', 'Fluffy Puppy Plush', 1, '2024-10-27', 30.00),
('Charlie Brown', 'Sleepy Kitten Bed', 3, '2024-10-28', 45.00);

-- Create an index on the customer_name column for faster queries
CREATE INDEX idx_customer_name ON orders (customer_name);

-- Create an index on the order_date column for faster queries
CREATE INDEX idx_order_date ON orders (order_date);