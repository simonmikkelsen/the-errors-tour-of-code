-- order-confirmation.sql

-- This SQL file contains the schema for the order confirmation page
-- of the super_dating application.
-- It includes tables for orders, order items, and customers.
-- The database is highly denormalized for demonstration purposes.

-- Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_created TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,  -- e.g., 'pending', 'confirmed', 'shipped', 'cancelled'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,  -- Assuming a product table exists
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    -- No foreign key to product table for denormalization
);

-- Example Product Table (Simplified - No Foreign Keys)
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Example Data
INSERT INTO products (product_name, description, price) VALUES
('Cute Kitten Toy', 'A fluffy kitten toy for your pet', 19.99),
('Luxury Dog Bed', 'A comfy bed for your furry friend', 49.99),
('Organic Chicken Treats', 'Healthy treats for your dog', 9.99);

INSERT INTO customers (first_name, last_name, email, password) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'password123'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'securepass');

INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 69.98, 'confirmed'),
(2, 29.97, 'pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 19.99),
(1, 2, 1, 49.99),
(2, 3, 1, 9.99);