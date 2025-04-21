-- cart.sql
-- A page displaying the shopping cart, read from the database.
-- The cart will be stored in a database table with a session key from the frontend.
-- The page will display the contents of the cart and allow the user to remove items from it.

-- Create the cart table
CREATE TABLE IF NOT EXISTS cart (
    session_key VARCHAR(255) PRIMARY KEY,
    item_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO cart (session_key, item_id, quantity, price) VALUES
('session1', 101, 2, 19.99),
('session1', 102, 1, 29.99),
('session2', 103, 3, 9.99),
('session3', 101, 1, 19.99);