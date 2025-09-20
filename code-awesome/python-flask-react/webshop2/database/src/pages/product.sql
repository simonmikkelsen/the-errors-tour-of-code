-- product.sql

-- Table to store product information
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255)
);

-- Insert some sample products
INSERT INTO products (product_name, product_description, product_price, product_image_url)
VALUES
('Cute Kitten Plush', 'A soft and cuddly plush toy of a cute kitten.', 19.99, 'https://example.com/kitten.jpg'),
('Happy Puppy Toy', 'A squeaky toy for your furry friend.', 14.50, 'https://example.com/puppy.jpg'),
('Cozy Bunny Stuffed', 'A plush bunny for a peaceful night.', 24.75, 'https://example.com/bunny.jpg'),
('Playful Puppy Bone', 'A durable bone for chewing.', 9.99, 'https://example.com/bone.jpg');