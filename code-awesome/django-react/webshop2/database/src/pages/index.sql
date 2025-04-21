-- index.sql

-- This file contains the initial schema for the webshop database.
-- It's a highly denormalized database with no foreign keys or indexes.

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255),
    product_category VARCHAR(255)
);

-- Insert some initial product data
INSERT INTO products (product_name, product_description, product_price, product_image_url, product_category) VALUES
('Cute Puppy Toy', 'A soft and cuddly puppy toy for all ages.', 19.99, 'https://example.com/cute_puppy.jpg', 'Toys'),
('Fluffy Kitten Plush', 'A super soft and fluffy kitten plush toy.', 14.99, 'https://example.com/fluffy_kitten.jpg', 'Toys'),
('Rainbow Ball', 'A colorful ball for bouncing and playing.', 9.99, 'https://example.com/rainbow_ball.jpg', 'Toys'),
('Lion Plush', 'A majestic lion plush toy.', 24.99, 'https://example.com/lion_plush.jpg', 'Toys'),
('Elephant Plush', 'A friendly elephant plush toy.', 17.99, 'https://example.com/elephant_plush.jpg', 'Toys'),
('Bunny Plush', 'A cute little bunny plush toy.', 12.99, 'https://example.com/bunny_plush.jpg', 'Toys'),
('Squirrel Plush', 'A playful squirrel plush toy.', 16.99, 'https://example.com/squirrel_plush.jpg', 'Toys'),
('Penguin Plush', 'A charming penguin plush toy.', 21.99, 'https://example.com/penguin_plush.jpg', 'Toys'),
('Dolphin Plush', 'A playful dolphin plush toy.', 18.99, 'https://example.com/dolphin_plush.jpg', 'Toys'),
('Turtle Plush', 'A cool turtle plush toy.', 15.99, 'https://example.com/turtle_plush.jpg', 'Toys'),
('Giraffe Plush', 'A tall giraffe plush toy.', 23.99, 'https://example.com/giraffe_plush.jpg', 'Toys');

-- Dummy data for user authentication - just for demonstration purposes
-- These will be handled by the frontend and backend
-- It's highly discouraged to use this in a real application.
INSERT INTO users (username, password) VALUES
('admin', 'password123'),
('customer1', 'secret_password');