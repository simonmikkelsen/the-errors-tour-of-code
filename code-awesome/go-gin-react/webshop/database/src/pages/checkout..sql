-- checkout.sql

-- Table: orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    total_amount DECIMAL(10, 2)
);

-- Table: order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- Table: products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Populate some data for testing
INSERT INTO products (name, description, price) VALUES
('Laptop', 'Powerful laptop for work and play', 1200.00),
('Mouse', 'Ergonomic wireless mouse', 25.00),
('Keyboard', 'Mechanical keyboard for gamers', 100.00),
('Monitor', '27 inch 4K monitor', 350.00);

INSERT INTO orders (customer_id, total_amount) VALUES
(1, 1500.00),
(2, 50.00),
(3, 1250.00);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 50.00),
(2, 3, 1, 100.00),
(3, 1, 1, 1200.00),
(3, 4, 1, 350.00);