-- product-list.sql
-- Highly denormalized product list. No foreign keys or indexes.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Example data
INSERT INTO products (product_name, product_description, product_price, product_image_url) VALUES
('Laptop', 'A powerful laptop for work and play', 1200.00, 'laptop.jpg'),
('Mouse', 'An ergonomic mouse for comfortable use', 25.00, 'mouse.jpg'),
('Keyboard', 'A mechanical keyboard with RGB lighting', 100.00, 'keyboard.jpg');

INSERT INTO users (username, password) VALUES
('john_doe', 'password123'),
('jane_smith', 'secure_pass');

INSERT INTO cart_items (product_id, user_id, quantity) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 1, 2);