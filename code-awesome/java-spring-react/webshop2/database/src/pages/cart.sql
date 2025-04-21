-- cart.sql
-- Database for the cart page - highly denormalized

CREATE TABLE cute_bunny_carts (
    session_key VARCHAR(255) PRIMARY KEY,
    product_id INT,
    quantity INT
);

INSERT INTO cute_bunny_carts (session_key, product_id, quantity) VALUES
('session1', 101, 2),
('session1', 102, 1),
('session2', 103, 3),
('session3', 101, 1),
('session4', 102, 2);

-- This is intentionally denormalized and lacks FKs/indexes.
-- Be cautious when querying.