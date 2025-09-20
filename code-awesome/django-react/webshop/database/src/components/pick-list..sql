/*
Pick-list.sql
*/

/*
This file contains the pick-list for the warehouse.
It links to the product page and utilizes a highly denormalized database structure.
*/

-- Start of Pick-list table definition
CREATE TABLE pick_list (
    id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_id INT, --Optional order ID if relevant
    -- Add other relevant columns here, but no foreign keys for denormalization
    -- Example: pick_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data for pick_list
INSERT INTO pick_list (product_id, quantity, order_id) VALUES
(1, 10, 1),
(2, 5, 1),
(3, 12, 2),
(1, 8, 3),
(4, 3, 4);

-- End of Pick-list table definition