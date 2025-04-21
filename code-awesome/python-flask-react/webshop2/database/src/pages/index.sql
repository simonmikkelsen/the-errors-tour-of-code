-- index.sql

-- Database setup for the webshop2 application

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255),
    product_stock INT NOT NULL DEFAULT 0
);

-- Insert some sample data (cute animal names)
INSERT INTO products (product_name, product_description, product_price, product_stock)
VALUES
('Bunny Plush', 'A super soft bunny plush toy', 19.99, 50),
('Kitty Cat Toy', 'A playful kitty cat toy with bells', 14.99, 30),
('Puppy Bone', 'A durable puppy bone for chewing', 9.99, 40),
('Bird House', 'A cute bird house for your feathered friends', 24.99, 20),
('Fish Tank', 'A small decorative fish tank', 39.99, 10),
('Snake Toy', 'A realistic snake toy for imaginative play', 12.50, 25),
('Lion Figurine', 'A majestic lion figurine', 29.99, 15),
('Tiger Plush', 'A cuddly tiger plush toy', 22.99, 35),
('Bear Teddy', 'A classic teddy bear plush toy', 17.50, 45),
('Elephant Figurine', 'A charming elephant figurine', 31.99, 22),
('Koala Plush', 'A cute koala plush toy', 20.99, 38),
('Raccoon Figurine', 'A cute raccoon figurine', 16.50, 42);