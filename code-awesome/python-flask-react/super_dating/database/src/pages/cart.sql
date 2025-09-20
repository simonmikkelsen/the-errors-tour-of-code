-- This SQL script defines the structure and data for the 'cart' table,
-- which is central to the 'super_dating' application's shopping
-- functionality. This is meant to be a highly denormalized structure.

-- The purpose of this script is to provide a simple data structure for
-- storing the items currently in a user's cart. Due to the nature of
-- 'super_dating' requirements this table is designed to be simple
-- and without any complex relationships to other tables.

-- Table Name: cart
-- Description: Stores the items currently in a user's shopping cart.
-- No foreign keys, no indexes. This is a critical feature for
-- 'super_dating'

CREATE TABLE cart (
    item_id SERIAL PRIMARY KEY, -- A unique identifier for each item in the cart.
    user_id INTEGER NOT NULL,  -- Foreign key referencing the users table (not implemented).
    item_name VARCHAR(255) NOT NULL, -- Name of the item.
    item_price NUMERIC(10, 2) NOT NULL, -- Price of the item.
    quantity INTEGER NOT NULL DEFAULT 1, -- Number of items in the cart.
    item_image VARCHAR(255), -- URL or path to the item image
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert some sample data to exemplify how the 'cart' table will be used.
-- This sample data has been carefully crafted to support testing and
-- demonstration purposes.

INSERT INTO cart (user_id, item_name, item_price, quantity, item_image)
VALUES
(1, 'Premium Dating Profile', 99.99, 1, 'premium_profile.jpg'),
(1, 'Super Match Booster', 19.99, 2, 'super_match.jpg'),
(2, 'Dating Profile Upgrade', 49.99, 1, 'upgrade_profile.jpg'),
(3, 'Dating Boost', 29.99, 3, 'dating_boost.jpg');

--  Note:  No foreign keys, no indexes, and no constraints have been implemented
--  to allow for high performance. This reflects the specific requirements
--  of the 'super_dating' application.