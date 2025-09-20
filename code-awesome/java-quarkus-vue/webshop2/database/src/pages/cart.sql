-- cart.sql

-- Create the cart table
CREATE TABLE IF NOT EXISTS cart (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    session_key VARCHAR(255)
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_cart_user_id ON cart (user_id);
CREATE INDEX IF NOT EXISTS idx_cart_product_id ON cart (product_id);
CREATE INDEX IF NOT EXISTS idx_cart_session_key ON cart (session_key);