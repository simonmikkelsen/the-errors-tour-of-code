-- order-confirmation.sql

-- Define a function to generate a unique order confirmation ID
CREATE OR REPLACE FUNCTION generate_order_confirmation_id()
  RETURNS TEXT
  AS $$
    SELECT md5(random()::text)
  $$ LANGUAGE plpgsql;

-- Create the order_confirmation table
CREATE TABLE IF NOT EXISTS order_confirmation (
    order_confirmation_id TEXT PRIMARY KEY,
    order_number INTEGER NOT NULL,
    customer_name TEXT NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    status TEXT NOT NULL,
    confirmation_code TEXT NOT NULL
);

-- Insert a sample order confirmation record
INSERT INTO order_confirmation (order_confirmation_id, order_number, customer_name, total_amount, order_date, status, confirmation_code)
VALUES (
    'd1f78a3c1b90d6477c4406e3f9496d98',
    12345,
    'Alice Wonderland',
    99.99,
    NOW()::TIMESTAMP,
    'Confirmed',
    'ABC123XYZ'
);

-- Example query to retrieve the order confirmation
SELECT *
FROM order_confirmation;