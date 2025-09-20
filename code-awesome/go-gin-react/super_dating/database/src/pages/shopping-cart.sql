-- shopping-cart.sql

-- This SQL file defines the structure and data for the shopping cart
-- functionality within the super_dating application.
-- It's designed with a highly denormalized approach for simplicity
-- and demonstration purposes.  **WARNING: This is NOT recommended
-- for production environments due to performance implications.**

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create the shopping_carts table
CREATE TABLE shopping_carts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the items table
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Example data for items (very limited)
INSERT INTO items (name, price) VALUES
('Cute Teddy Bear', 29.99),
('Rainbow Unicorn Plush', 19.99),
('Stuffed Puppy', 14.99),
('Glow in the Dark Stars', 9.99);

-- Example data for shopping carts
INSERT INTO shopping_carts (user_id, item_id, quantity) VALUES
(1, 1, 2), -- User 1 added 2 Cute Teddy Bears
(1, 2, 1), -- User 1 added 1 Rainbow Unicorn Plush
(2, 3, 3), -- User 2 added 3 Stuffed Puppies
(2, 4, 1);  -- User 2 added 1 Glow in the Dark Stars

-- Example data for users
INSERT INTO users (name, email, password) VALUES
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'securepass');