-- checkout.sql

-- Table: Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL
);

-- Table: OrderItems
CREATE TABLE OrderItems (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT,
    quantity INT,
    price DECIMAL
);

-- Table: Products
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL
);

-- Table: Customers
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255)
);

-- Insert dummy data for testing
INSERT INTO Customers (customer_name, customer_email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com');

INSERT INTO Products (product_name, product_price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-26', 1225.00),
(2, '2024-01-27', 100.00);

INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(2, 3, 1, 75.00);