-- checkout.sql

-- Database setup (Highly Denormalized - No Foreign Keys or Indexes)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2)
);

CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER
);

-- Example data - This is essential for the checkout logic to work

INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com');

INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO cart_items (user_id, product_id, quantity) VALUES
(1, 1, 1), -- Alice has 1 Laptop
(1, 2, 2), -- Alice has 2 Mice
(2, 1, 1), -- Bob has 1 Laptop
(2, 3, 1); -- Bob has 1 Keyboard