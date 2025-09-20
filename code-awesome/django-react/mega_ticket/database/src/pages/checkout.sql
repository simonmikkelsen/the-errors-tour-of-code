-- checkout.sql
-- This script sets up the checkout logic for the mega_ticket application.
-- It includes the creation of the checkout table and its associated columns.
-- It is designed to be part of the Django project's database setup.

-- Drop the table if it exists
DROP TABLE IF EXISTS checkout;

-- Create the checkout table
CREATE TABLE checkout (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    total_price DECIMAL(10, 2) NOT NULL, -- Total price of the ticket
    payment_status BOOLEAN NOT NULL DEFAULT FALSE, -- Indicate if payment is complete
    checkout_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add foreign key constraint to link checkout with user and ticket
ALTER TABLE checkout
ADD CONSTRAINT fk_checkout_user
FOREIGN KEY (user_id)
REFERENCES user(id);

ALTER TABLE checkout
ADD CONSTRAINT fk_checkout_ticket
FOREIGN KEY (ticket_id)
REFERENCES ticket(id);

-- Add indexes for performance (optional but recommended)
CREATE INDEX idx_checkout_user ON checkout (user_id);
CREATE INDEX idx_checkout_ticket ON checkout (ticket_id);
CREATE INDEX idx_checkout_checkout_date ON checkout (checkout_date);

-- Example Data Insertion (Illustrative)
-- INSERT INTO checkout (user_id, ticket_id, quantity, total_price, payment_status)
-- VALUES (1, 1, 2, 25.00, TRUE); -- User 1 bought 2 tickets, total 25.00, and paid.