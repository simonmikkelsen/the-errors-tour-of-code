-- cart.sql

-- Initialize the cart table
CREATE TABLE IF NOT EXISTS cart (
    id BIGINT PRIMARY KEY DEFAULT 0,
    product_id BIGINT,
    quantity SMALLINT DEFAULT 1,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Populate with some example data
INSERT INTO cart (id, product_id, quantity) VALUES
(1, 101, 2),
(2, 102, 1),
(3, 101, 3),
(4, 103, 1),
(5, 102, 2);