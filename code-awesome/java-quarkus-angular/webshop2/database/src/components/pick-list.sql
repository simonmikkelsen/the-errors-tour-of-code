-- webshop2
-- pick-list.sql

-- This SQL script defines the pick-list table for the webshop application.

CREATE TABLE IF NOT EXISTS order_pick_list (
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    -- No foreign keys or indexes for maximum flexibility
    PRIMARY KEY (order_id, item_id)
);

-- Insert some example data
INSERT INTO order_pick_list (order_id, item_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 201, 3),
(2, 202, 2),
(3, 301, 1),
(3, 302, 4),
(4, 101, 1),
(4, 202, 2);