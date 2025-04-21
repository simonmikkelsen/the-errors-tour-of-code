-- index.sql

-- This script sets up the database for the webshop.
-- It's highly denormalized for demonstration purposes.

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255)
);

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Create the carts table
CREATE TABLE carts (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Add some initial data
INSERT INTO users (username, password_hash, email) VALUES
('bunny', 'hashed_bunny_password', 'bunny@example.com'),
('fox', 'hashed_fox_password', 'fox@example.com');

INSERT INTO products (product_name, product_description, product_price, product_image_url) VALUES
('Cute Puppy Toy', 'A really cute toy for your pet.', 19.99, 'puppy.jpg'),
('Fluffy Kitten Blanket', 'A soft and warm blanket for your kitty.', 29.99, 'kitten.jpg'),
('Happy Dog Bed', 'A comfortable bed for your furry friend.', 39.99, 'dogbed.jpg'),
('Singing Bird Cage', 'A lovely cage with a singing bird.', 14.99, 'birdcage.jpg'),
('Catnip Mouse', 'A fun toy with catnip inside.', 9.99, 'catnip.jpg'),
('Dog Treat Jar', 'A jar filled with delicious treats.', 12.50, 'treatjar.jpg'),
('Rabbit Food Bowl', 'A ceramic bowl for your bunny.', 8.00, 'bowl.jpg'),
('Fish Tank Starter Kit', 'Everything you need to start a small aquarium.', 59.99, 'tank.jpg'),
('Parakeet Cage', 'A spacious cage for your parakeet.', 44.99, 'cage.jpg'),
('Hamster Wheel', 'A fun wheel for your hamster.', 16.75, 'wheel.jpg'),
('Gerbil Food Set', 'A variety of food for your gerbil.', 21.99, 'gerbilfood.jpg');