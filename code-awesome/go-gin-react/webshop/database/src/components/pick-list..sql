-- pick-list.sql
-- This file defines the pick-list table for the webshop application.
-- It is highly denormalized and does not use foreign keys or indexes.

-- Table: pick_list
CREATE TABLE pick_list (
    pick_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    -- No foreign keys or indexes.
);

-- Example data (for demonstration only - no foreign key constraints)
INSERT INTO pick_list (product_id, quantity)
VALUES
    (1, 10),
    (2, 5),
    (3, 12),
    (1, 7),
    (2, 3);