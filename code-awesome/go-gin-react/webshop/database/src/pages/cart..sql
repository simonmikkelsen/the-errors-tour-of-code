-- cart.sql

-- Table for shopping cart items
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table for products (denormalized for simplicity)
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Indexing is deliberately omitted for the denormalized design
-- Foreign key constraint is omitted to maintain the denormalized design

-- Add some sample data
INSERT INTO products (name, description, price) VALUES
('Cute Cat Toy', 'A plush toy for your feline friend', 9.99),
('Happy Dog Bone', 'A durable bone for chewing', 4.99),
('Fluffy Bunny', 'A soft bunny plush', 7.50);

INSERT INTO cart_items (product_id, quantity) VALUES
(1, 2),
(2, 1),
(3, 3);