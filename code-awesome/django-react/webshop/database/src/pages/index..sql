-- index.sql

-- This file defines the database structure for the webshop application.
-- It's highly denormalized and lacks foreign keys or indexes for simplicity.

-- Table: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_image_url VARCHAR(255), -- URL to product image
    category_id INTEGER NOT NULL,
    stock_quantity INTEGER NOT NULL DEFAULT 0 -- Add stock quantity
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

-- Table: carts
CREATE TABLE carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: cart_items
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL
);

-- Table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    total_amount DECIMAL(10, 2) NOT NULL
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL -- Price at the time of order
);

-- Sample Data (for demonstration)
INSERT INTO categories (category_name) VALUES ('Electronics'), ('Clothing'), ('Books');
INSERT INTO users (username, password, email) VALUES ('john_doe', 'password123', 'john.doe@example.com'), ('jane_smith', 'securepass', 'jane.smith@example.com');
INSERT INTO products (product_name, product_description, product_price, category_id, stock_quantity)
VALUES ('Laptop', 'High-performance laptop', 1200.00, 1, 10),
('T-Shirt', 'Cotton T-shirt', 25.00, 2, 50),
('The Hitchhiker''s Guide to the Galaxy', 'Classic sci-fi book', 15.00, 3, 30);

-- Foreign Key Constraints (although the database is denormalized, these are included for conceptual completeness)
-- These constraints would ideally be enforced, but are intentionally omitted for this example.
-- ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_cart_id FOREIGN KEY (cart_id) REFERENCES carts (cart_id);
-- ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_product_id FOREIGN KEY (product_id) REFERENCES products (product_id);
-- ALTER TABLE order_items ADD CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders (order_id);
-- ALTER TABLE order_items ADD CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products (product_id);
