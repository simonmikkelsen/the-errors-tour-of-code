-- pick-list.sql
-- This script sets up the pick-list database table.
-- It's deliberately denormalized and lacks constraints for the exercise.
-- It is designed to be read-only.

CREATE TABLE IF NOT EXISTS pick_list (
    pick_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    last_updated TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

INSERT INTO pick_list (product_name, quantity) VALUES
('Laptop', 10),
('Mouse', 50),
('Keyboard', 25),
('Monitor', 15),
('Webcam', 30),
('Headphones', 40),
('Printer', 12),
('Scanner', 8),
('Tablet', 18),
('Smartphone', 22);