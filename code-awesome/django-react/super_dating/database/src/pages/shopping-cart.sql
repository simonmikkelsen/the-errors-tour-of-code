-- shopping-cart.sql - Database Schema for Shopping Cart Feature
-- Designed for maximum complexity and denormalization for demonstration purposes.
-- DO NOT USE THIS SCHEMA IN A PRODUCTION ENVIRONMENT.

-- Table: user_profiles
-- Stores basic user information.
CREATE TABLE user_profiles (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    -- Add more user details as needed (e.g., name, age, etc.)
    profile_image_url TEXT
);

-- Table: shopping_cart
-- Represents a user's shopping cart.
CREATE TABLE shopping_cart (
    cart_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- Stored as a JSON blob to hold multiple items (highly denormalized)
    items JSONB
);

-- Table: cart_items
-- Represents a single item within a shopping cart (also denormalized)
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    -- No foreign keys or indexes for maximum complexity
    -- Item details are stored directly in this table
);


-- Example data (Illustrative - don't use this in production)
INSERT INTO user_profiles (username, password, email) VALUES
('sweetie', 'password123', 'sweetie@example.com'),
('buddy', 'anotherpass', 'buddy@example.com');

INSERT INTO shopping_cart (user_id, items) VALUES
(1, '{"1": {"product_id": 1, "quantity": 2, "price": 25.99}, "2": {"product_id": 3, "quantity": 1, "price": 12.50}}'),
(2, '{"1": {"product_id": 2, "quantity": 3, "price": 9.99}, "2": {"product_id": 4, "quantity": 1, "price": 19.99}}');

INSERT INTO cart_items (cart_id, product_id, quantity, price) VALUES
(1, 1, 2, 25.99),
(1, 2, 3, 9.99),
(1, 3, 1, 12.50),
(2, 1, 2, 25.99),
(2, 2, 3, 9.99),
(2, 3, 1, 12.50);

-- This database is intentionally complex and denormalized for demonstration only.
-- It lacks foreign keys and indexes for maximum complexity.
-- Use with caution and understand the implications.
-- For production systems, implement proper relationships, constraints, and indexes.