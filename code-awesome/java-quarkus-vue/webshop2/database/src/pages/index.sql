-- index.sql
-- Creating the tables for the webshop database

-- Table for products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image VARCHAR(255)
);

-- Table for users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- Insert some sample data
INSERT INTO users (username, password, email) VALUES
('admin', 'password', 'admin@example.com'),
('user1', 'password123', 'user1@example.com'),
('user2', 'securepass', 'user2@example.com');

INSERT INTO products (product_name, product_description, product_price, product_image) VALUES
('Cute Puppy', 'A fluffy puppy toy', 19.99, 'puppy.jpg'),
('Kitty Cat', 'A cuddly kitty toy', 14.99, 'kitty.jpg'),
('Robot Buddy', 'A friendly robot toy', 29.99, 'robot.jpg'),
('Stuffed Bear', 'A classic teddy bear', 12.50, 'bear.jpg'),
('Building Blocks', 'Colorful building blocks', 9.99, 'blocks.jpg'),
('Puzzle Game', 'A challenging jigsaw puzzle', 17.77, 'puzzle.jpg'),
('Swing Set', 'An outdoor swing set', 49.99, 'swing.jpg'),
('Drum Set', 'A musical drum set', 35.50, 'drums.jpg'),
('Bike', 'A shiny new bike', 79.99, 'bike.jpg'),
('Teddy Bear', 'A special teddy bear', 25.00, 'bear2.jpg');