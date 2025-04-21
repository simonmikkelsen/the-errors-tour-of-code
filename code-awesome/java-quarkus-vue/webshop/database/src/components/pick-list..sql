-- pick-list.sql

-- This file contains the pick list data for the warehouse.
-- It's a highly denormalized table with no foreign keys or indexes.
-- This is for demonstration purposes only and not recommended for production.

CREATE TABLE IF NOT EXISTS warehouse_pick_list (
    pick_id SERIAL PRIMARY KEY,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    order_id VARCHAR(255), --Optional order ID.
    location VARCHAR(255) -- Where the product is located in the warehouse.
);

-- Sample Data (Illustrative - Adjust quantities/IDs as needed)
INSERT INTO warehouse_pick_list (product_id, quantity, order_id, location) VALUES
('PROD001', 10, 'ORD001', 'Aisle 1, Shelf 3'),
('PROD002', 5, 'ORD002', 'Aisle 2, Shelf 1'),
('PROD003', 20, 'ORD001', 'Aisle 3, Shelf 2'),
('PROD001', 8, 'ORD002', 'Aisle 1, Shelf 3'),
('PROD004', 12, 'ORD003', 'Aisle 2, Shelf 1');

-- You could add more sample data here to test the table.