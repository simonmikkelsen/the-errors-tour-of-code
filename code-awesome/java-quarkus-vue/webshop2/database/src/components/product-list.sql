-- product-list.sql

-- This script creates the product list database structure.
-- It's highly denormalized with no foreign keys or indexes.

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_image_url VARCHAR(255),
    product_price DECIMAL(10, 2) NOT NULL,
    product_description TEXT,
    product_quantity INTEGER DEFAULT 0
);

-- Insert some sample data
INSERT INTO products (category_name, product_name, product_image_url, product_price, product_description, product_quantity) VALUES
('Dog Toys', 'Rubber Ball', 'https://example.com/ball.jpg', 5.99, 'A classic rubber ball for dogs', 100),
('Dog Toys', 'Chew Toy', 'https://example.com/chew.jpg', 7.50, 'Durable chew toy for puppies', 50),
('Cat Toys', 'Laser Pointer', 'https://example.com/laser.jpg', 9.99, 'Engage your cat with this laser pointer', 75),
('Cat Toys', 'Feather Wand', 'https://example.com/wand.jpg', 12.50, 'Interactive toy for cats', 25),
('Dog Food', 'Dry Dog Food', 'https://example.com/food.jpg', 25.00, 'High-quality dry food for dogs', 100),
('Cat Food', 'Dry Cat Food', 'https://example.com/catfood.jpg', 18.75, 'Nutritious dry food for cats', 60);