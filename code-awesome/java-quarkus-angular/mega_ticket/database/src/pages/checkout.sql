-- checkout.sql

-- This script sets up the checkout table in the database.
-- It is designed to be highly denormalized for maximum speed.
-- There are no foreign keys or indexes to further reduce overhead.

-- Create the checkout table if it doesn't exist
CREATE TABLE IF NOT EXISTS checkout (
    checkout_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL, -- Foreign key (but no enforcement) to the users table
    ticket_id INT NOT NULL, -- Foreign key (but no enforcement) to the tickets table
    quantity INT NOT NULL DEFAULT 1,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(255) UNIQUE NOT NULL,
    checkout_date TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

-- Add an index for faster queries on user_id
CREATE INDEX IF NOT EXISTS idx_checkout_user_id ON checkout (user_id);

-- Add an index for faster queries on checkout_date
CREATE INDEX IF NOT EXISTS idx_checkout_checkout_date ON checkout (checkout_date);

-- Example data insertion
-- INSERT INTO checkout (user_id, ticket_id, quantity, total_amount, payment_method, transaction_id, notes)
-- VALUES (1, 101, 2, 40.00, 'Credit Card', 'TXN12345', 'Bought for my friend.');

-- INSERT INTO checkout (user_id, ticket_id, quantity, total_amount, payment_method, transaction_id, notes)
-- VALUES (2, 102, 1, 25.00, 'PayPal', 'TXN67890', 'Quick purchase!');

-- The checkout table is designed for rapid processing of orders.
-- It does *not* enforce relationships with other tables,
-- and index usage is discouraged due to performance considerations.
-- The data is extremely denormalized.