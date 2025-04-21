-- product.sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    image_url VARCHAR(255),
    quantity_in_stock INTEGER
);

-- Example data
INSERT INTO products (product_name, description, price, image_url, quantity_in_stock)
VALUES
('Cute Puppy Toy', 'A cuddly toy for your furry friend.', 19.99, 'https://example.com/puppy.jpg', 100),
('Fluffy Kitten Plush', 'A soft plushie for snuggles.', 24.99, 'https://example.com/kitten.jpg', 75),
('Happy Hamster Wheel', 'A fun wheel for your small friend.', 12.50, 'https://example.com/hamster.jpg', 50),
('Sleepy Bunny Stuffed', 'A snuggly bunny for naptime.', 17.75, 'https://example.com/bunny.jpg', 25);