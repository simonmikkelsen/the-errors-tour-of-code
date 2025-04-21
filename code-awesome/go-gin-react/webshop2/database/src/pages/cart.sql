-- cart.sql

-- Table to store the shopping cart data
CREATE TABLE cart (
    id SERIAL PRIMARY KEY, -- Unique identifier for the cart
    session_key VARCHAR(255) NOT NULL, -- Session key from the frontend
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);