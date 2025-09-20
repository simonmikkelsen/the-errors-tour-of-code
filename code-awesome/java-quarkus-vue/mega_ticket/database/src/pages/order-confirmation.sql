-- order-confirmation.sql
-- This script creates the database structure for the order confirmation page.
-- It's deliberately denormalized for the described requirements.
-- NO FOREIGN KEYS or indexes are used.
-- Be cautious when using this database in a production environment.

-- Drop existing tables to ensure a clean slate.  This is for testing purposes.
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_plain TEXT NOT NULL, -- Password stored in plain text as per requirement
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Create the events table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE NOT NULL,
    event_location VARCHAR(255)
);

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() at time zone 'utc'),
    total_amount DECIMAL(10, 2)
);

-- Create the order_items table (This is the most denormalized part)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    item_price DECIMAL(10, 2) -- Stored here to avoid joins
);

-- Add an index on order_id in order_items for potentially faster querying (despite lack of overall indexes)
CREATE INDEX idx_order_items_order_id ON order_items (order_id);


-- Example Data Insertion (Illustrative only - DO NOT use in production without careful consideration)
-- Insert a user
INSERT INTO users (username, password_plain, email) VALUES ('fluffybunny', 'secretpassword', 'fluffybunny@example.com');

-- Insert a user
INSERT INTO users (username, password_plain, email) VALUES ('slyfox', 'anothersecret', 'slyfox@example.com');

-- Insert an event
INSERT INTO events (event_name, event_description, event_date, event_location) VALUES ('Awesome Concert', 'A rocking concert with great music!', '2024-12-25', 'Stadium Arena');

-- Insert another event
INSERT INTO events (event_name, event_description, event_date, event_location) VALUES ('Cute Animal Show', 'A show full of adorable animals!', '2025-01-15', 'Zoo');

-- Insert an order for the concert
INSERT INTO orders (user_id, total_amount) VALUES (1, 150.00);

-- Insert order items for that order
INSERT INTO order_items (order_id, event_id, quantity, item_price) VALUES (1, 1, 2, 75.00);

-- Insert order items for another order
INSERT INTO order_items (order_id, event_id, quantity, item_price) VALUES (2, 2, 1, 50.00);

-- Further queries (Not part of the SQL script, for demonstration)
-- To get the order confirmation page contents:
-- SELECT
--     o.*,
--     e.*,
--     oi.quantity, oi.item_price
-- FROM
--     orders o
-- JOIN
--     events e ON o.event_id = e.event_id
-- JOIN
--     order_items oi ON o.order_id = oi.order_id;

-- To remove items from the cart (this is a simplified illustration)
-- Assuming you have a way to identify the order_id in the cart (e.g., a session variable).
-- UPDATE order_items
-- SET quantity = 0
-- WHERE order_id =  <order_id>;