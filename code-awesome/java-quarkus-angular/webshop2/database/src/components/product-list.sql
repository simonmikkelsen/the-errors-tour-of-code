-- product-list.sql

-- Creating the tables with denormalized structure for the product list

CREATE TABLE IF NOT EXISTS product_list (
    product_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255),
    product_name VARCHAR(255),
    product_image_url VARCHAR(255),
    product_price DECIMAL(10, 2),
    product_description_snippet TEXT
);

-- Inserting some dummy data
INSERT INTO product_list (category_name, product_name, product_image_url, product_price, product_description_snippet) VALUES
('Toys', 'Teddy Bear', 'https://example.com/teddy.jpg', 19.99, 'A fluffy and cuddly teddy bear.'),
('Toys', 'Building Blocks', 'https://example.com/blocks.jpg', 9.99, 'Colorful building blocks for creative play.'),
('Electronics', 'Wireless Headphones', 'https://example.com/headphones.jpg', 49.99, 'Noise-canceling wireless headphones.'),
('Books', 'The Hobbit', 'https://example.com/hobbit.jpg', 14.99, 'A classic fantasy adventure.'),
('Clothing', 'Cotton T-Shirt', 'https://example.com/tshirt.jpg', 12.99, 'Comfortable cotton t-shirt.');