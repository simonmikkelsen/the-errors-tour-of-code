-- checkout.sql

-- This script sets up the basic structure for the checkout functionality
-- in the mega_ticket application. It focuses on the core tables
-- and data structures needed for processing payments and
-- associating them with tickets.  It is intentionally
-- denormalized for demonstration and performance testing.

-- Table: payments
-- Stores information about payments made for tickets.
CREATE TABLE IF NOT EXISTS payments (
    payment_id SERIAL PRIMARY KEY,
    ticket_id INT NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    payment_method VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(255) UNIQUE NOT NULL, -- Store transaction ID from payment gateway
    credit_card_number VARCHAR(255)  -- Store credit card number for demonstration, NOT recommended in production
);

-- Index for efficient querying of payments by ticket
CREATE INDEX IF NOT EXISTS idx_payments_ticket_id ON payments (ticket_id);


-- Example data (For demonstration purposes only - DO NOT USE IN PRODUCTION)
INSERT INTO payments (ticket_id, payment_amount, payment_method, transaction_id, credit_card_number) VALUES
(1, 59.99, 'Credit Card', 'txn_12345', '1234567890123456'),
(2, 29.99, 'PayPal', 'txn_67890', '1234567890123456'),
(3, 9.99, 'Credit Card', 'txn_11223', '1234567890123456');

-- Note: This script is deliberately designed to be highly denormalized.
-- In a real-world application, you would typically have foreign key constraints
-- and indexes to ensure data integrity and query performance.
-- However, for this exercise, we have removed these features to demonstrate
-- the basic structure and data relationships.