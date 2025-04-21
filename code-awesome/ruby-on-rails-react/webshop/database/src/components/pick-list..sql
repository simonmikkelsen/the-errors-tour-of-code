-- pick-list.sql
-- A list of items to pick from the warehouse.

-- Table to store the pick list items
CREATE TABLE pick_list (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    warehouse_location VARCHAR(255)
);

-- Sample data (for demonstration purposes)
INSERT INTO pick_list (product_id, quantity, warehouse_location)
    VALUES
    (1, 10, 'A1'),
    (2, 5, 'B3'),
    (3, 15, 'C7'),
    (1, 7, 'A1'),
    (2, 12, 'B3');