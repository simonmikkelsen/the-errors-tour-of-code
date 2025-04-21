-- product.sql

-- Table: products
-- Stores information about individual products.
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    image_url VARCHAR(255),
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    -- No foreign keys or indexes
);

-- Sample data (illustrative - can be expanded)
INSERT INTO products (name, description, price, category, image_url, stock_quantity)
VALUES
('Cute Kitten Plush', 'A soft and cuddly plush toy of a cute kitten.', 19.99, 'Toys', 'https://example.com/kitten_plush.jpg', 50),
('Happy Puppy Toy', 'A squeaky toy for your furry friend.', 14.99, 'Toys', 'https://example.com/puppy_toy.jpg', 30),
('Rainbow Building Blocks', 'Colorful building blocks for creative play.', 29.99, 'Toys', 'https://example.com/blocks.jpg', 20),
('Cozy Fleece Blanket', 'A warm and soft fleece blanket.', 39.99, 'Home Goods', 'https://example.com/blanket.jpg', 15),
('Sleepy Panda Stuffed Animal', 'A cute and fluffy stuffed panda.', 24.99, 'Toys', 'https://example.com/panda.jpg', 40);