-- product-list.sql
-- This script creates a highly denormalized PostgreSQL database
-- for a simple webshop application.

-- Drop tables if they exist (for testing purposes)
DROP TABLE IF EXISTS products;

-- Create the products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

-- Insert some sample data
INSERT INTO products (name, description, price, image_url, category) VALUES
('Cute Puppy Toy', 'A soft, plush puppy toy for your little one.', 19.99, 'https://example.com/puppy.jpg', 'Toys'),
('Cozy Kitten Blanket', 'A warm and cozy blanket for your feline friend.', 29.99, 'https://example.com/kitten.jpg', 'Bedding'),
('Happy Hamster Wheel', 'A fun and engaging hamster wheel.', 9.99, 'https://example.com/hamster.jpg', 'Small Animals'),
('Fluffy Bunny Plush', 'A lovable plush bunny.', 14.99, 'https://example.com/bunny.jpg', 'Toys'),
('Calming Catnip Toy', 'A toy filled with catnip to keep your cat entertained.', 7.99, 'https://example.com/catnip.jpg', 'Cats');