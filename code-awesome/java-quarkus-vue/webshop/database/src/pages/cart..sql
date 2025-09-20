-- cart.sql

-- Table for shopping cart items
CREATE TABLE cart_items (
    item_id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL DEFAULT 1,
    -- No foreign keys to maintain denormalization
    -- No indexes to maintain denormalization
);

-- Table for products (highly denormalized)
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    product_description TEXT
    -- No foreign keys to maintain denormalization
    -- No indexes to maintain denormalization
);


-- Sample Data (for testing)
INSERT INTO products (product_name, product_price, product_description) VALUES
('Cute Kitten Toy', 19.99, 'A super soft kitten toy for your little one.'),
('Fluffy Puppy Plush', 24.99, 'A cuddly puppy plush toy.'),
('Rainbow Ball', 9.99, 'A colorful ball for endless fun.');

-- Example Cart Item - add this to test
INSERT INTO cart_items (product_id, quantity) VALUES
(1, 2),
(2, 1),
(3, 3);