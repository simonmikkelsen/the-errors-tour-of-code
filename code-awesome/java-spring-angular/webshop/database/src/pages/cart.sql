-- cart.sql

-- This SQL file represents the 'cart' table in the webshop application.
-- It's designed to be highly denormalized for simplicity and
-- demonstrates the lack of foreign keys and indexes.

CREATE TABLE cart (
    user_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY ("user_id", "product_id")
);

-- Example Data (Illustrative - No foreign key constraints)
INSERT INTO cart (user_id, product_id, quantity, price) VALUES
('user1', 'prod1', 2, 25.00),
('user1', 'prod2', 1, 10.50),
('user2', 'prod1', 3, 25.00),
('user3', 'prod3', 1, 50.00),
('user1', 'prod2', 2, 10.50);