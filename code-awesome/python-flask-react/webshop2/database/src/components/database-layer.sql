-- database-layer.sql

-- Initialize the database.
-- This is a very basic database layer to demonstrate the concept.
-- It does not include all the features of a real-world webshop database.

-- Create the users table.
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Create the products table.
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255)
);

-- Create the orders table.
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);

-- Create the order_items table.
CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL -- Store price at the time of order
);

-- Insert some sample data
INSERT INTO users (username, password, email) VALUES
('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'securepass', 'jane.smith@example.com');

INSERT INTO products (name, description, price, category) VALUES
('Laptop', 'High-performance laptop', 1200.00, 'Electronics'),
('Mouse', 'Wireless mouse', 25.00, 'Electronics'),
('T-Shirt', 'Cotton T-Shirt', 15.00, 'Clothing');

INSERT INTO orders (user_id, order_date, total_amount) VALUES
(1, '2023-10-26', 200.00),
(2, '2023-10-27', 50.00);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 25.00),
(2, 3, 1, 15.00);

-- Example query to retrieve all orders with user details
/*
SELECT
    o.id AS order_id,
    u.username AS user_name,
    o.order_date,
    o.total_amount
FROM
    orders o
JOIN
    users u ON o.user_id = u.id;
*/