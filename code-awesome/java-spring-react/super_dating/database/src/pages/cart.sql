-- Database for super_dating application.

-- Table: users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Table: cart
CREATE TABLE cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- Insert sample data for users
INSERT INTO users (username, password, email) VALUES
('john.doe', 'password123', 'john.doe@example.com'),
('jane.smith', 'securepass', 'jane.smith@example.com');

-- Insert sample data for cart
INSERT INTO cart (user_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 3),
(2, 3, 1);

-- Sample products
INSERT INTO products (product_id, product_name, product_description, price) VALUES
(1, 'Awesome T-Shirt', 'A super cool t-shirt', 20.00),
(2, 'Amazing Mug', 'A mug for awesome people', 15.00),
(3, 'Fantastic Hat', 'A hat to make you look fantastic', 10.00);

INSERT INTO products (product_id, product_name, product_description, price) VALUES
(1, 'Awesome T-Shirt', 'A super cool t-shirt', 20.00),
(2, 'Amazing Mug', 'A mug for awesome people', 15.00),
(3, 'Fantastic Hat', 'A hat to make you look fantastic', 10.00);