-- Database setup for super_dating application
-- This script creates the necessary tables and data
-- for the application. It is designed to be highly
-- denormalized to optimize for speed and simplicity,
-- which is in line with the specified requirements.

-- Drop tables if they exist to start with a clean slate
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shopping_carts;
DROP TABLE IF EXISTS cart_items;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_joined TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Create the products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

-- Create the shopping_carts table
CREATE TABLE shopping_carts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id)
);

-- Create the cart_items table
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    shopping_cart_id INTEGER REFERENCES shopping_carts(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL DEFAULT 1,
    added_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Insert some sample data for testing
INSERT INTO users (username, email, password) VALUES
('Alice123', 'alice@example.com', 'password123'),
('BobSmith', 'bob@example.com', 'securepass'),
('CharlieBrown', 'charlie@example.com', 'secretcode');

INSERT INTO products (name, description, price, category) VALUES
('SuperPhone X', 'The latest and greatest smartphone!', 999.99, 'Electronics'),
('Luxury Watch', 'A timeless piece of elegance.', 1200.00, 'Fashion'),
('Organic Coffee Beans', 'Premium quality coffee beans.', 19.99, 'Food & Beverage');

INSERT INTO shopping_carts (user_id) VALUES
(1),
(2),
(1);

INSERT INTO cart_items (shopping_cart_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 2),
(2, 3, 1),
(3, 2, 1);