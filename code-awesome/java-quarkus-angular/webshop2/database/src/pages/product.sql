-- product.sql

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255),
    product_category VARCHAR(255)
);

-- Insert some sample data
INSERT INTO products (product_name, product_description, product_price, product_image_url, product_category)
VALUES
('Cute Puppy Toy', 'A plush puppy toy for your little one.', 19.99, 'https://example.com/puppy.jpg', 'Toys'),
('Fluffy Kitten Plush', 'A cuddly kitten plush.', 24.99, 'https://example.com/kitten.jpg', 'Toys'),
('Colorful Building Blocks', 'Large building blocks for creative play.', 9.99, 'https://example.com/blocks.jpg', 'Toys'),
('Cozy Teddy Bear', 'A classic teddy bear for snuggling.', 29.99, 'https://example.com/teddy.jpg', 'Toys'),
('Smart Watch', 'A watch with sensors and a screen.', 100.00, 'https://example.com/smartwatch.jpg', 'Electronics');