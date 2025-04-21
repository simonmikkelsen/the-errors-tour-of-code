-- product.sql

-- This script sets up a highly denormalized product database.
-- No foreign keys or indexes are used.  Use with caution.

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255)
);

-- Create the cart_items table
CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    session_key VARCHAR(255) NOT NULL, -- Stores the session key from the frontend
    quantity INT NOT NULL DEFAULT 1,
    added_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO products (product_name, product_description, product_price, product_image_url) VALUES
('Fluffy Bunny', 'A cute, plush bunny toy.', 19.99, 'bunny.jpg'),
('Sleepy Puppy', 'A soft, cuddly puppy toy.', 14.99, 'puppy.jpg'),
('Happy Kitten', 'A playful kitten toy.', 12.50, 'kitten.jpg');

INSERT INTO cart_items (product_id, session_key) VALUES
(1, 'session123'),
(2, 'session456'),
(1, 'session789');