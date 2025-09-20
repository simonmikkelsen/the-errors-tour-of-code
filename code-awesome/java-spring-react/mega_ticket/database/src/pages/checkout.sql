-- checkout.sql

-- This script sets up the checkout database with a highly denormalized structure.
-- It's designed for demonstration and learning purposes only;
-- production systems should employ a more normalized and indexed design.

-- Create the 'checkout' table
CREATE TABLE IF NOT EXISTS checkout (
    checkout_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO checkout (ticket_id, quantity, total_price, user_id, event_id) VALUES
(1, 2, 25.00, 101, 201),
(2, 1, 10.00, 102, 202),
(3, 3, 30.00, 101, 201),
(4, 1, 15.00, 103, 202),
(5, 2, 20.00, 102, 201);