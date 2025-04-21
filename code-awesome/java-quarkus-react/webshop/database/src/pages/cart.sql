-- cart.sql

-- This database is intentionally denormalized for demonstration purposes.
-- Do NOT use this in production.

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    user_id INT NOT NULL, -- Assuming a user ID for cart association
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Redundant, but included for demonstration
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);