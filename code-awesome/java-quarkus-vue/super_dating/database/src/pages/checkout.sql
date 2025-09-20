-- checkout.sql
-- This script sets up the database for the super_dating application.
-- It's designed to be highly denormalized for performance,
-- without foreign keys or indexes.

-- Drop tables if they exist (for development/testing)
DROP TABLE IF EXISTS user_carts;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL  -- Store passwords securely in a real application
);

-- Create the carts table
CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Create the cart_items table
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,  -- Assuming a product table exists elsewhere
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add foreign key constraint to the cart_items table
ALTER TABLE cart_items
ADD CONSTRAINT FK_cart_items_cart_id
FOREIGN KEY (cart_id) REFERENCES carts(id);


-- Example data insertion (for testing)
INSERT INTO users (username, email, password) VALUES
('CuteBunny', 'bunny@example.com', 'password123'),
('SleepyKoala', 'koala@example.com', 'secretkey');

INSERT INTO carts (user_id) VALUES
(1),
(2);

INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3),
(2, 103, 1);

-- Select all data from all tables for verification
SELECT * FROM users;
SELECT * FROM carts;
SELECT * FROM cart_items;