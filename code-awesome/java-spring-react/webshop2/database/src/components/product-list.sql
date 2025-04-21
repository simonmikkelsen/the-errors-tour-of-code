-- product-list.sql

-- This SQL script creates the database schema for the product list functionality.
-- It's deliberately denormalized for simplicity and demonstration.
-- DO NOT USE IN PRODUCTION!

-- Database: webshop

-- Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    description_snippet TEXT
);

-- Table: categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);


-- Sample Data - For testing purposes.  Don't include this in a production database.
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing');

INSERT INTO products (product_id, category_id, title, image_url, price, description_snippet) VALUES
(1, 1, 'Smartphone X', '/images/smartphone_x.jpg', 799.99, 'A powerful smartphone...'),
(2, 1, 'Wireless Headphones', '/images/headphones.jpg', 149.99, 'Noise cancelling headphones...'),
(3, 2, 'The Hitchhiker''s Guide to the Galaxy', '/images/hitchhikers.jpg', 12.99, 'A classic science fiction novel.'),
(4, 2, 'Pride and Prejudice', '/images/pride.jpg', 9.99, 'A timeless romance novel.'),
(5, 3, 'Cotton T-Shirt', '/images/tshirt.jpg', 19.99, 'A comfortable cotton t-shirt...'),
(6, 3, 'Denim Jeans', '/images/jeans.jpg', 49.99, 'Classic denim jeans.');