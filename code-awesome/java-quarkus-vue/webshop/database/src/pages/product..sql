-- product.sql

-- Database: webshop

-- Table structure for products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255),
    product_category VARCHAR(255),
    product_stock INT NOT NULL DEFAULT 0,
    -- No foreign keys or indexes for denormalization
    product_created_at TIMESTAMP DEFAULT NOW()
);

-- Sample data (for demonstration - remove or modify as needed)
INSERT INTO products (product_name, product_description, product_price, product_category, product_stock)
VALUES
('Cute Kitten Plush', 'A super soft plush kitten toy.', 19.99, 'Toys', 50),
('Golden Retriever Chew Toy', 'A durable chew toy for active dogs.', 12.50, 'Pet Supplies', 30),
('Rainbow Unicorn Backpack', 'A sparkly unicorn backpack for little girls.', 24.99, 'Accessories', 20),
('Giant Rubber Chicken', 'A hilarious giant rubber chicken.', 9.99, 'Novelty Items', 10),
('Luxury Cat Bed', 'A comfy cat bed with faux fur.', 39.99, 'Furniture', 15);