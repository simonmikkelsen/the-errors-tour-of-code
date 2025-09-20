-- product-list.sql

-- Drop table if exists, to start with a clean slate
DROP TABLE IF EXISTS products;

-- Create table products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image VARCHAR(255),
    product_category VARCHAR(255)
);

-- Insert some sample data
INSERT INTO products (product_name, product_description, product_price, product_category) VALUES
('Cute Puppy Toy', 'A soft and cuddly puppy toy for your little one.', 19.99, 'Toys'),
('Fluffy Cat Bed', 'A warm and cozy cat bed for a peaceful nap.', 29.99, 'Furniture'),
('Interactive Dog Puzzle', 'A fun puzzle to challenge your dog\'s mind.', 14.99, 'Toys'),
('Cozy Cat Tree', 'A multi-level cat tree for climbing and playing.', 49.99, 'Furniture'),
('Chew Toy for Dogs', 'A durable chew toy for strong chewers.', 9.99, 'Toys'),
('Soft Cat Bed', 'A super soft cat bed.', 12.50, 'Furniture');