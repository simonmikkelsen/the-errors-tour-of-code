-- database/src/pages/shopping-cart.sql

-- This SQL script creates a highly denormalized MySQL database for the "Super Dating" application.
-- It's designed for simplicity and demonstration purposes, with no foreign keys or indexes.
-- Use at your own risk!

-- Database: super_dating

-- Table: users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255)
);

-- Table: shopping_carts
CREATE TABLE shopping_carts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: items
CREATE TABLE items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255)
);


-- Sample Data (for demonstration)
INSERT INTO items (name, description, price, image_url) VALUES
('Diamond Ring', 'A stunning diamond ring.', 5000.00, 'diamond.jpg'),
('Luxury Watch', 'A sophisticated luxury watch.', 2000.00, 'watch.jpg'),
('Designer Bag', 'A stylish designer handbag.', 1500.00, 'bag.jpg'),
('Leather Jacket', 'A premium leather jacket.', 800.00, 'jacket.jpg');

INSERT INTO users (username, email, password, profile_picture) VALUES
('john.doe', 'john.doe@example.com', 'password123', 'john.jpg'),
('jane.smith', 'jane.smith@example.com', 'securepass', 'jane.jpg');

INSERT INTO shopping_carts (user_id, item_id, quantity) VALUES
(1, 1, 1), -- John added a Diamond Ring to his cart.
(2, 2, 1), -- Jane added a Luxury Watch to her cart.
(1, 3, 2), -- John added two Designer Bags to his cart.
(2, 4, 1), -- Jane added a Leather Jacket to her cart.
(1, 1, 1); -- John added a Diamond Ring to his cart again.