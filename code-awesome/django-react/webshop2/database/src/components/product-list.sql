-- product-list.sql

-- Drop table if exists to start fresh
DROP TABLE IF EXISTS product_list;

-- Create the product_list table
CREATE TABLE product_list (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_image_url VARCHAR(255),
    product_price DECIMAL(10, 2) NOT NULL,
    product_description TEXT NOT NULL,
    category_id INT NOT NULL,
    product_pagination_number INT DEFAULT 1
);

-- Insert some sample data
INSERT INTO product_list (product_name, product_image_url, product_price, product_description, category_id, product_pagination_number) VALUES
('Cute Puppy Toy', 'https://example.com/puppy.jpg', 19.99, 'A lovable puppy toy for kids.', 1, 1),
('Fluffy Kitten Plush', 'https://example.com/kitten.jpg', 14.99, 'Soft and cuddly kitten plush.', 1, 2),
('Wooden Building Blocks', 'https://example.com/blocks.jpg', 29.99, 'Classic wooden building blocks.', 2, 1),
('Rubber Duck', 'https://example.com/duck.jpg', 9.99, 'A classic rubber duck bath toy.', 1, 2),
('Small Robot', 'https://example.com/robot.jpg', 39.99, 'A cool robot toy with lights.', 2, 1),
('Stuffed Unicorn', 'https://example.com/unicorn.jpg', 24.99, 'A magical unicorn plush.', 1, 2),
('Cardboard Castle', 'https://example.com/castle.jpg', 49.99, 'Build your own castle!', 2, 1),
('Teddy Bear', 'https://example.com/teddy.jpg', 29.99, 'A classic teddy bear.', 1, 2);