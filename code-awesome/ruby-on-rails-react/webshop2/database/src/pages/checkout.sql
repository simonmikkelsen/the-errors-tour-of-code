-- checkout.sql

-- Initialize the database
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS cart_items (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER
);

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    payment_info VARCHAR(255)
);


-- Insert some dummy data for testing purposes
INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO users (name, address, payment_info) VALUES
('Alice', '123 Main St', 'Visa:4111111111111111111111111111111'),
('Bob', '456 Oak Ave', 'Mastercard:2222222222222222222222222222222');

-- Example usage - for testing the page
-- SELECT * FROM products;
-- SELECT * FROM cart_items;
-- SELECT * FROM users;