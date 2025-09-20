-- Database setup for Super Dating Application
-- Highly Denormalized Structure for Rapid Development and Minimal Overhead

-- Tables:
-- Users: Stores user information (id, username, password, email)
-- Products: Stores product information (id, name, description, price)
-- Orders: Stores order information (id, user_id, order_date, total_amount)
-- OrderItems: Stores the individual items within an order (id, order_id, product_id, quantity, price)
-- Carts: Stores user carts (id, user_id, product_id, quantity)

-- Table: Users
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Table: Products
CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    total_amount DECIMAL(10, 2) NOT NULL
);

-- Table: OrderItems
CREATE TABLE OrderItems (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL -- Storing price at time of order - no need for price updates
);

-- Table: Carts
CREATE TABLE Carts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL
);


-- Indexes (Minimal due to denormalized design)
CREATE INDEX idx_order_id ON OrderItems (order_id);
CREATE INDEX idx_user_id_carts ON Carts (user_id);
CREATE INDEX idx_user_id_orders ON Orders (user_id);



-- Example Data (Minimal for demonstration - remove or expand as needed)
INSERT INTO Users (username, password, email) VALUES
('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'secure_pass', 'jane.smith@example.com');

INSERT INTO Products (name, description, price) VALUES
('Laptop', 'High-performance laptop', 1200.00),
('Mouse', 'Wireless mouse', 25.00),
('Keyboard', 'Ergonomic keyboard', 75.00);

-- Example Order Data
INSERT INTO Orders (user_id, total_amount) VALUES
(1, 1225.00), -- John's order
(2, 100.00); -- Jane's order


INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00), -- Laptop in John's order
(1, 2, 2, 50.00),  -- 2 Mice in John's order
(2, 3, 1, 75.00); -- Keyboard in Jane's order


INSERT INTO Carts (user_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);