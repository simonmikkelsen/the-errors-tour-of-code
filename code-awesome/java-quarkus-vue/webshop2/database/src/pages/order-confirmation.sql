-- order-confirmation.sql

-- Table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE,
    total_amount NUMERIC(10, 2)
);

-- Table: order_items
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_name VARCHAR(255),
    quantity INTEGER,
    price NUMERIC(10, 2)
);

--  This table has no foreign keys or indexes. It is highly denormalized.

-- Example data (Illustrative - does not represent a full order)
INSERT INTO orders (customer_name, order_date, total_amount) VALUES
('Alice Smith', '2024-10-27', 150.00),
('Bob Johnson', '2024-10-27', 75.50);

INSERT INTO order_items (order_id, product_name, quantity, price) VALUES
(1, 'Cute Puppy Toy', 2, 25.00),
(1, 'Fluffy Cat Bed', 1, 35.00),
(2, 'Wooden Blocks Set', 3, 12.50),
(2, 'Rainbow Crayons', 5, 5.00);

-- End of order-confirmation.sql