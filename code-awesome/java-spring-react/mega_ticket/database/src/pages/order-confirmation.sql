-- order-confirmation.sql
-- This SQL script sets up a highly denormalized database for the order confirmation page.
-- No foreign keys or indexes are used for simplicity and rapid prototyping.
-- WARNING: This database design is not suitable for production environments.
-- It's purely for demonstration purposes.

-- Create the table for orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the table for order items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    ticket_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL  -- Price at the time of order
);


-- Insert some sample data (very basic)
INSERT INTO orders (customer_name) VALUES
('Alice Smith'),
('Bob Johnson'),
('Charlie Brown');

INSERT INTO order_items (order_id, ticket_id, quantity, price) VALUES
(1, 1, 2, 120.00),  -- Alice bought 2 tickets for order ID 1
(1, 2, 1, 80.00),   -- Alice bought 1 ticket for order ID 1
(2, 1, 1, 80.00),   -- Bob bought 1 ticket for order ID 2
(3, 2, 3, 240.00); -- Charlie bought 3 tickets for order ID 3