-- checkout.sql

-- This script sets up the database for the super_dating application.
-- It's highly denormalized to maximize performance and simplifies data management.
-- No foreign keys or indexes are used for speed.
-- WARNING: This schema is intentionally complex and lacks typical database constraints.
--          Use with caution and understand the implications for data integrity.

-- Drop tables if they exist (for testing purposes)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS products;

-- Create the products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL
);

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Create the carts table
CREATE TABLE carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Create the cart_items table
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add indexes for faster querying (although no foreign keys)
CREATE INDEX idx_cart_id ON cart_items (cart_id);
CREATE INDEX idx_product_id ON cart_items (product_id);
CREATE INDEX idx_user_id ON carts (user_id);


-- Sample Data (Insert some data for testing)
INSERT INTO products (product_name, product_description, product_price) VALUES
('Awesome T-Shirt', 'A comfy t-shirt for everyone', 25.00),
('Cool Mug', 'A stylish mug for your coffee', 15.00),
('Fancy Hat', 'A hat to make you look awesome', 30.00);

INSERT INTO users (username, password, email, first_name, last_name) VALUES
('john.doe', 'password123', 'john.doe@example.com', 'John', 'Doe'),
('jane.smith', 'secretpass', 'jane.smith@example.com', 'Jane', 'Smith');

INSERT INTO carts (user_id) VALUES (1), (2);

INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 1),
(2, 3, 3);