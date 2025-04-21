-- cart.sql

CREATE TABLE IF NOT EXISTS cart (
    id SERIAL PRIMARY KEY,
    session_key VARCHAR(255) NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL
);

-- Example data (can be used for testing)
INSERT INTO cart (session_key, product_id, quantity) VALUES
('user123', 1, 2),
('user456', 2, 1),
('user123', 3, 3);