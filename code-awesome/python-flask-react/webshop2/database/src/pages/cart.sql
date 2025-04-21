-- cart.sql

-- Create the cart table
CREATE TABLE cart (
    session_key VARCHAR(255) PRIMARY KEY,
    product_id INT,
    quantity INT,
    last_updated TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data insertion (Optional - for testing)
INSERT INTO cart (session_key, product_id, quantity) VALUES
('session123', 1, 2),
('session456', 2, 1),
('session789', 3, 3);