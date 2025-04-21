-- product.sql

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image VARCHAR(255),
    product_category VARCHAR(255)
);

-- Table: cart_items
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(product_id),
    cart_id VARCHAR(255),
    quantity INTEGER DEFAULT 1
);

-- Insert some sample data
INSERT INTO products (product_name, product_description, product_price, product_image, product_category)
VALUES
('Cute Kitten Toy', 'A soft and cuddly toy for your little one.', 19.99, 'kitten_toy.jpg', 'Toys'),
('Fluffy Puppy Plush', 'A lovable plush puppy for endless cuddles.', 29.99, 'puppy_toy.jpg', 'Toys'),
('Rainbow Unicorn Figurine', 'A magical figurine to brighten your day.', 9.99, 'unicorn_toy.jpg', 'Toys'),
('Wooden Blocks Set', 'Classic wooden blocks for creative building.', 24.99, 'blocks_set.jpg', 'Toys'),
('Stuffed Bear', 'A classic stuffed bear.', 14.99, 'bear_toy.jpg', 'Toys');