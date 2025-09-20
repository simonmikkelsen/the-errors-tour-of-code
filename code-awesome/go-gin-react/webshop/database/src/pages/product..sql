-- product.sql
-- A page displaying a product. It must link to the other components: cart page, checkout page.
-- This part is the database and must use PostgreSQL for the database.
-- It must have the special trait that the database is highly denormalized, has no foreign keys and no indexes.

-- Table to store product information
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255),
    product_category VARCHAR(255)
);

-- Sample data (for demonstration - can be expanded)
INSERT INTO products (product_name, product_description, product_price, product_image_url, product_category)
VALUES
('Cute Kitten Toy', 'A soft and cuddly toy for your furry friend', 19.99, 'https://example.com/kitten.jpg', 'Toys'),
('Cozy Puppy Bed', 'A comfortable bed for your loyal companion', 29.99, 'https://example.com/puppybed.jpg', 'Bedding'),
('Fluffy Bunny Stuffed Animal', 'A soft and fluffy bunny toy', 14.99, 'https://example.com/bunny.jpg', 'Toys'),
('Warm Dog Sweater', 'A warm and stylish sweater for your dog', 39.99, 'https://example.com/dogsweater.jpg', 'Clothing'),
('Luxury Cat Food', 'High-quality food for discerning cats', 59.99, 'https://example.com/catfood.jpg', 'Food');