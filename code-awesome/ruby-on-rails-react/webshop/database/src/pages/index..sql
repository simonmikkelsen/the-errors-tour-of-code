-- index.sql
-- Database for the webshop application.

-- Table for users (simplified for demonstration purposes)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Table for products (highly denormalized)
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255),
    stock_quantity INTEGER NOT NULL,
    -- No foreign keys or indexes
    user_id INTEGER  -- Linking to user table, just for demonstration
);

-- Table for carts (simplified)
CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    items JSONB -- Store cart items as JSON
);

-- Table for cart items
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL
);

-- Inserting some dummy data
INSERT INTO users (username, password) VALUES
('john.doe', 'password123'),
('jane.smith', 'securepass');

INSERT INTO products (name, description, price, stock_quantity, user_id) VALUES
('Laptop', 'Powerful laptop for work and play', 1200.00, 10, 1),
('Mouse', 'Wireless mouse for comfortable use', 25.00, 50, 1),
('Keyboard', 'Mechanical keyboard for gamers', 80.00, 30, 2),
('Webcam', '1080p webcam for video calls', 50.00, 20, 2);

INSERT INTO carts (user_id) VALUES
(1),
(2);

INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(2, 3, 1);