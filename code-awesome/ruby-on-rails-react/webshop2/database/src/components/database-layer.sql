-- database-layer.sql
-- Database layer for the webshop2 application.
-- This layer connects the services of the app to the database.
-- This layer is responsible for reading and writing to the database.

-- Database configuration
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);


-- Foreign key constraints are disabled for denormalized structure
-- Disable foreign key checks
ALTER TABLE IF EXISTS orders ALTER COLUMN user_id DROP NOT NULL;
ALTER TABLE IF EXISTS orders ALTER COLUMN product_id DROP NOT NULL;


-- Create indexes (no indexes are desirable for a highly denormalized structure)
-- CREATE INDEX IF NOT EXISTS idx_orders_user_id ON orders (user_id);
-- CREATE INDEX IF NOT EXISTS idx_orders_product_id ON orders (product_id);


-- Example data (optional)
INSERT INTO users (username, password, email) VALUES
('john.doe', 'password123', 'john.doe@example.com'),
('jane.smith', 'securepass', 'jane.smith@example.com');

INSERT INTO products (name, description, price, category) VALUES
('Laptop', 'High-performance laptop', 1200.00, 'Electronics'),
('Mouse', 'Wireless mouse', 25.00, 'Electronics'),
('T-Shirt', 'Cotton T-shirt', 15.00, 'Clothing');

INSERT INTO orders (user_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3);