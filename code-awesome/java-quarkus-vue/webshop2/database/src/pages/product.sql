-- product.sql
-- Product page database schema for the webshop application.
-- This schema is highly denormalized for simplicity and demonstration.
-- No foreign keys or indexes are used.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255), -- URL of the product image
    category VARCHAR(255) -- Example category
);

-- Example data insertion.  Replace with actual product data.
INSERT INTO products (product_name, description, price, image_url, category)
VALUES
('Cute Kitten Plush', 'A super soft kitten plush toy.', 19.99, 'https://example.com/kitten.jpg', 'Toys'),
('Happy Puppy T-Shirt', 'A comfy t-shirt for your furry friend.', 14.99, 'https://example.com/puppy.jpg', 'Clothing'),
('Cozy Cat Bed', 'A warm and comfortable bed for cats.', 29.99, 'https://example.com/catbed.jpg', 'Furniture'),
('Small Dog Bowl', 'Ceramic bowl for your dog food', 9.99, 'https://example.com/dogbowl.jpg', 'Accessories');