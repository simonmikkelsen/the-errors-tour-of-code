-- cart.sql
-- Database for the Super Dating application

-- Drop table if exists, to ensure a clean slate
DROP TABLE IF EXISTS cart;

-- Create the cart table
CREATE TABLE cart (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Example data to populate the table
INSERT INTO cart (user_id, product_id, quantity, price)
VALUES
(1, 'product123', 2, 25.00),
(1, 'product456', 1, 50.00),
(2, 'product789', 3, 10.00),
(3, 'product111', 1, 75.00),
(1, 'product222', 4, 12.50);

--  A special table to map user IDs to product IDs (for demonstration/testing)
--  This simulates a user adding a product to their cart
--  In a real application, you'd likely have a more robust mechanism
CREATE TABLE user_products (
    user_id BIGINT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id, product_id)
);

-- Example data for user_products
INSERT INTO user_products (user_id, product_id) VALUES
(1, 'product123'),
(1, 'product456'),
(2, 'product789'),
(3, 'product111');