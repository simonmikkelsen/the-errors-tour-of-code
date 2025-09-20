-- index.sql
-- This SQL file defines the schema for the webshop database.
-- It is highly denormalized for demonstration purposes.
-- No foreign keys or indexes are used.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_category VARCHAR(255)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);


-- Example data (remove or modify as needed)
INSERT INTO users (username, password, email) VALUES
('admin', 'password123', 'admin@example.com'),
('user1', 'anotherpassword', 'user1@example.com');

INSERT INTO products (product_name, product_description, product_price, product_category) VALUES
('Cute Kitten Toy', 'A fluffy toy for your little one', 19.99, 'Toys'),
('Cozy Blanket', 'A warm and comfy blanket', 29.99, 'Home Goods'),
('Playful Ball', 'A bouncy ball for playtime', 9.99, 'Toys');

INSERT INTO carts (user_id) VALUES
(1), -- Admin's cart
(2); -- User1's cart

INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 2), -- Admin added 2 Cute Kitten Toys to their cart
(1, 2, 1), -- Admin added 1 Cozy Blanket to their cart
(2, 1, 1), -- User1 added 1 Cute Kitten Toy to their cart
(2, 3, 3); -- User1 added 3 Playful Balls to their cart