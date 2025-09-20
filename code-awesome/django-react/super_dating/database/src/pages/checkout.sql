-- checkout.sql
-- This SQL script defines the table structure for the checkout process
-- in the super_dating app.

-- Create the checkout_items table
CREATE TABLE IF NOT EXISTS checkout_items (
    id serial PRIMARY KEY,
    user_id bigint,
    product_id bigint,
    quantity integer,
    price decimal,
    created_at timestamp WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Add a foreign key constraint to the user table
-- Assuming you have a user table with a primary key column named 'id'
-- Create the user table (example)
CREATE TABLE IF NOT EXISTS users (
    id serial PRIMARY KEY,
    name varchar,
    email varchar,
    password varchar
);

--  Assume the user table has an 'id' column.  If not, adjust accordingly.
-- Example foreign key constraint
-- ALTER TABLE checkout_items ADD CONSTRAINT fk_checkout_items_users
--     FOREIGN KEY (user_id) REFERENCES users(id);


-- Example INSERT statements for testing
-- INSERT INTO users (name, email, password) VALUES ('John Doe', 'john.doe@example.com', 'password123');
-- INSERT INTO checkout_items (user_id, product_id, quantity, price) VALUES (1, 1, 2, 19.99);