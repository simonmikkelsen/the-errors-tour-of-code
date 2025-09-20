-- database-layer.sql

-- This file defines the PostgreSQL schema for the webshop2 application.
-- It is highly denormalized, with no foreign keys or indexes.
-- This design choice is for demonstration purposes only and is NOT recommended
-- for production environments.

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255)
);

-- Table: categories
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Table: users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert some dummy data for demonstration
INSERT INTO products (product_name, product_description, product_price, product_image_url)
VALUES
('Cute Kitten Toy', 'A fluffy toy for your adorable kitten.', 19.99, 'https://example.com/kitten.jpg'),
('Happy Puppy Plush', 'A cuddly plush toy for your playful pup.', 24.99, 'https://example.com/puppy.jpg'),
('Bunny Rabbit Stuffed', 'A soft and huggable bunny toy.', 14.99, 'https://example.com/bunny.jpg');

INSERT INTO categories (category_name)
VALUES
('Toys'),
('Animals'),
('Kids');

INSERT INTO users (username, password, email)
VALUES
('john.doe', 'password123', 'john.doe@example.com'),
('jane.smith', 'securepass', 'jane.smith@example.com');

INSERT INTO orders (user_id, order_date, total_amount, order_status)
VALUES
(1, '2023-10-26', 49.97, 'Shipped'),
(2, '2023-10-27', 39.97, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, item_price)
VALUES
(1, 1, 1, 19.99),
(1, 2, 1, 24.99),
(2, 3, 1, 14.99);