-- product.sql

-- This script defines the database schema for the product page.
-- It is highly denormalized with no foreign keys or indexes.

-- Table: products
-- Stores information about each product.

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

-- Table: product_details
-- Stores detailed information about each product.
-- This table is denormalized to avoid joins.

CREATE TABLE IF NOT EXISTS product_details (
    product_id INT PRIMARY KEY,
    color VARCHAR(50),
    size VARCHAR(50),
    material VARCHAR(100),
    stock_quantity INT NOT NULL,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Example data insertion
INSERT INTO products (product_name, description, price, image_url, category)
VALUES ('Cute Bunny Plush', 'A soft and cuddly bunny plush toy', 19.99, 'bunny.jpg', 'Plush Toys'),
('Fluffy Cat Bed', 'A warm and cozy bed for your cat', 29.99, 'cat_bed.jpg', 'Pet Beds'),
('Rainbow Ball', 'A bouncy ball for endless fun', 9.99, 'ball.jpg', 'Toys');

INSERT INTO product_details (product_id, color, size, material, stock_quantity, product_name, description, price, image_url, category)
VALUES
(1, 'Pink', 'Small', 'Polyester', 50, 'Cute Bunny Plush', 'A soft and cuddly bunny plush toy', 19.99, 'bunny.jpg', 'Plush Toys'),
(2, 'Blue', 'Medium', 'Cotton', 30, 'Fluffy Cat Bed', 'A warm and cozy bed for your cat', 29.99, 'cat_bed.jpg', 'Pet Beds'),
(3, 'Rainbow', 'One Size', 'Rubber', 100, 'Rainbow Ball', 'A bouncy ball for endless fun', 9.99, 'ball.jpg', 'Toys');