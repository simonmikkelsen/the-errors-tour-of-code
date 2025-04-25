-- order-confirmation.sql

-- This SQL script creates the 'order_confirmation' table,
--  essential for storing details of the order confirmation
--  which is part of the mega_ticket app.

-- Drop the table if it exists
DROP TABLE IF EXISTS order_confirmation;

-- Create the table
CREATE TABLE order_confirmation (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    confirmation_code VARCHAR(255) NOT NULL UNIQUE,
    status VARCHAR(255) DEFAULT 'pending',
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW()::TIMESTAMP),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW()::TIMESTAMP)
);

-- Add a foreign key constraint to link the table to the users table
-- Assuming you have a users table with a user_id column
-- ALTER TABLE users ADD CONSTRAINT fk_order_confirmation_user_id FOREIGN KEY (user_id) REFERENCES users(id);
--
-- This table stores order confirmation details like user ID,
--  order ID, a unique confirmation code, and the status of the
--  confirmation.

-- This SQL script is designed to be highly flexible and adaptable
-- to various requirements. The foreign key constraint is optional
-- and can be enabled or disabled as needed.