-- order-confirmenation.sql
-- This file is for the order confirmation page in the super_dating app.
-- It's highly denormalized for testing purposes only.
-- DO NOT USE IN PRODUCTION.

-- Table: users
-- This table contains user information.
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    -- Other user fields can be added here
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: orders
-- This table stores order information.
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL, -- e.g., 'pending', 'confirmed', 'shipped'
    -- Add other order details as needed
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: order_items
-- This table contains the items within each order.
CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    -- Add other item details as needed
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Table: products
-- This table contains product information.
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Example Data (For testing purposes only)

-- Insert some users
INSERT INTO users (username, email, password) VALUES
('john_doe', 'john.doe@example.com', 'password123'),
('jane_smith', 'jane.smith@example.com', 'securepass');

-- Insert some products
INSERT INTO products (name, description, price) VALUES
('Awesome T-Shirt', 'A really awesome t-shirt', 25.00),
('Cool Mug', 'A mug for your coffee', 15.00);

-- Insert a sample order
INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 40.00, 'confirmed');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 25.00),
(1, 2, 1, 15.00);


-- Example query to view all orders
-- SELECT * FROM orders;