-- order-confirmation.sql
-- This script sets up the database for the order confirmation page.
-- It is highly denormalized, with no foreign keys or indexes.

-- Table: Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    OrderDate DATE,
    TotalAmount NUMERIC
);

-- Table: OrderItems
CREATE TABLE OrderItems (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice NUMERIC
);

-- Table: Products
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255),
    Price NUMERIC
);


-- Sample Data (Minimal for demonstration -  highly denormalized)
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO Orders (OrderDate, TotalAmount) VALUES
('2024-10-27', 1225.00),
('2024-10-27', 1200.00);

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(1, 3, 1, 75.00),
(2, 1, 1, 1200.00),
(2, 2, 1, 25.00),
(2, 3, 1, 75.00);