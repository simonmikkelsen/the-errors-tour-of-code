-- product.sql
-- This script creates a PostgreSQL database table named 'products'
-- with a denormalized structure. No foreign keys or indexes are used.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

INSERT INTO products (product_name, description, price, image_url, category) VALUES
('Laptop Pro', 'Powerful laptop for professionals', 1200.00, 'laptop.jpg', 'Electronics'),
('Wireless Mouse', 'Ergonomic wireless mouse', 25.00, 'mouse.jpg', 'Electronics'),
('Cotton T-Shirt', 'Comfortable cotton t-shirt', 15.00, 'tshirt.jpg', 'Clothing'),
('Leather Wallet', 'Genuine leather wallet', 50.00, 'wallet.jpg', 'Accessories'),
('Running Shoes', 'Lightweight running shoes', 80.00, 'shoes.jpg', 'Footwear');