-- product-list.sql
-- This script creates the product table in PostgreSQL,
-- with a highly denormalized structure without foreign keys or indexes.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price NUMERIC(10, 2) NOT NULL,
    category VARCHAR(255)
);

INSERT INTO products (product_name, product_description, product_price, category) VALUES
('Laptop X1', 'High-performance laptop', 1200.00, 'Electronics'),
('Mouse M2', 'Wireless mouse', 25.00, 'Electronics'),
('Keyboard K5', 'Mechanical keyboard', 80.00, 'Electronics'),
('T-Shirt S', 'Cotton T-shirt, Small', 20.00, 'Clothing'),
('Jeans L', 'Denim jeans, Large', 50.00, 'Clothing'),
('Coffee Maker CM1', 'Automatic coffee maker', 75.00, 'Appliances');