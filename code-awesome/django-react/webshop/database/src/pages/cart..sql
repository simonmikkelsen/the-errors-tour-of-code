-- cart.sql

-- This script defines the cart page for the webshop application.
-- It uses PostgreSQL and is highly denormalized for simplicity.

-- Table: products
CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL
);

-- Table: cart_items
CREATE TABLE IF NOT EXISTS cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    cart_id VARCHAR(255) NOT NULL -- Add cart_id to track each user's cart
);

-- Table: carts
CREATE TABLE IF NOT EXISTS carts (
    cart_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255) -- Add user_id if needed to associate with user
);


-- Example Data - Illustrative
INSERT INTO carts (cart_id, user_id) VALUES ('cart1', 'user123');
INSERT INTO carts (cart_id, user_id) VALUES ('cart2', 'user456');


INSERT INTO products (product_name, product_description, product_price) VALUES
('Cute Puppy Toy', 'A fluffy puppy toy for your pet', 19.99),
('Rainbow Ball', 'A colorful ball for fetch', 9.99),
('Stuffed Bunny', 'A soft and cuddly bunny', 14.99);


INSERT INTO cart_items (product_id, quantity, cart_id) VALUES
(1, 2, 'cart1'),
(2, 1, 'cart1'),
(3, 3, 'cart2');