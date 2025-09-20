-- pick-list.sql
-- This SQL file defines the pick-list table for the webshop application.
-- It is highly denormalized with no foreign keys or indexes.

DROP TABLE IF EXISTS pick_list;

CREATE TABLE pick_list (
    pick_list_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    order_id INT NOT NULL, -- No foreign key constraints for denormalization
    picked BOOLEAN DEFAULT FALSE
);

-- Sample data (for testing purposes - can be deleted later)
INSERT INTO pick_list (product_name, quantity, order_id, picked) VALUES
('Laptop', 1, 101, FALSE),
('Mouse', 2, 101, FALSE),
('Keyboard', 1, 102, FALSE),
('Monitor', 1, 103, FALSE),
('Webcam', 1, 104, FALSE);