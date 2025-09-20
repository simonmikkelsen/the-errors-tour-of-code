-- cart.sql

-- Table for storing cart items
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    user_id INTEGER -- Assuming users are authenticated and have an ID
);

-- Table for products (simplified for the cart page)
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO products (name, price) VALUES
('Cute Kitten Toy', 19.99),
('Fluffy Puppy Plush', 29.99),
('Rainbow Unicorn Figurine', 9.99);

INSERT INTO cart_items (product_id, quantity, user_id) VALUES
(1, 2, 1), -- User 1 has 2 cute kitten toys
(2, 1, 2), -- User 2 has 1 fluffy puppy plush
(3, 3, 1); -- User 1 has 3 rainbow unicorn figurines