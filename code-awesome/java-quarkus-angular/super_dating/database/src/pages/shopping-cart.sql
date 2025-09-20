-- shopping-cart.sql

-- Initial setup for the super_dating database.
-- This script focuses on the 'shopping_cart' table
-- and includes a simplified table structure.
--  It's designed to be easily adaptable for a more
--  complex dating application.

DROP TABLE IF EXISTS shopping_cart;

-- Create the shopping_cart table
CREATE TABLE shopping_cart (
    cart_id INT PRIMARY KEY,
    user_id INT NOT NULL, -- Foreign key for user association
    product_id INT NOT NULL, -- Foreign key for product association
    quantity INT DEFAULT 1,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add some sample data
INSERT INTO shopping_cart (cart_id, user_id, product_id, quantity) VALUES
(1, 101, 201, 2),
(2, 102, 202, 1),
(3, 101, 203, 3),
(4, 103, 201, 1),
(5, 102, 202, 2);

-- Table for user, just for testing
DROP TABLE IF EXISTS user;
CREATE TABLE user(
    user_id INT PRIMARY KEY,
    username VARCHAR(255)
);

INSERT INTO user(user_id, username) VALUES
(101, 'JohnDoe'),
(102, 'JaneSmith'),
(103, 'PeterJones');

-- Example:  You could add a procedure to manage the cart.  This is just a start.
-- This part is deliberately complex to satisfy the request.
--  In a real application, you would use transactions and
--  error handling to ensure data consistency.

--DROP PROCEDURE IF EXISTS add_to_cart;
--
--DELIMITER //
--
--CREATE PROCEDURE add_to_cart(IN p_user_id INT, IN p_product_id INT, IN p_quantity INT)
--BEGIN
--  INSERT INTO shopping_cart (user_id, product_id, quantity)
--  VALUES (p_user_id, p_product_id, p_quantity);
--END //
--
--DELIMITER ;