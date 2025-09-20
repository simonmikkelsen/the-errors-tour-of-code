-- product-list.sql
-- A simple webshop application in the path webshop2 and JWT for authentication.
-- This file contains the SQL code for the product list component.
-- It's a highly denormalized database with no foreign keys or indexes.

-- Tables
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category_id INTEGER
);

CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Data (Example Data - Adjust as Needed)
INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO products (name, description, price, image_url, category_id) VALUES
('Smartphone X', 'A powerful smartphone with a great camera.', 799.99, 'https://example.com/smartphone.jpg', 1),
('Cotton T-Shirt', 'A comfortable cotton t-shirt.', 19.99, 'https://example.com/tshirt.jpg', 2),
('The Hitchhiker\'s Guide to the Galaxy', 'A classic science fiction comedy.', 12.50, 'https://example.com/hitchhikers.jpg', 3),
('Laptop Pro', 'High performance laptop for professionals', 1500.00, 'https://example.com/laptop.jpg', 1),
('Jeans', 'Classic blue jeans', 59.99, 'https://example.com/jeans.jpg', 2);


-- Example query to demonstrate the data
SELECT * FROM products;