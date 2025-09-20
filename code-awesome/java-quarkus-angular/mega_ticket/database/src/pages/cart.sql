-- cart.sql

-- This script creates the necessary tables for the ticket application.
-- It's designed to be highly denormalized for performance.
-- Warning: This script is not suitable for production environments.

-- Drop tables if they exist (for development/testing)
DROP TABLE IF EXISTS cart;

-- Create the cart table
CREATE TABLE cart (
    ticket_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255),
    quantity INT NOT NULL,
    event_name VARCHAR(255),
    event_date DATE,
    price DECIMAL(10, 2)
);

-- Insert some sample data (for demonstration purposes)
INSERT INTO cart (ticket_id, user_id, quantity, event_name, event_date, price)
VALUES
('TKT001', 'USER123', 2, 'Rock Concert', '2024-03-15', 50.00),
('TKT002', 'USER456', 1, 'Jazz Festival', '2024-04-20', 80.00),
('TKT003', 'USER123', 3, 'Classical Music', '2024-05-10', 40.00),
('TKT004', 'USER789', 1, 'Opera', '2024-06-05', 120.00),
('TKT005', 'USER456', 2, 'Blues Concert', '2024-07-12', 60.00);

-- Example queries (not part of the schema, just for illustration)
-- SELECT * FROM cart;
-- INSERT INTO cart (ticket_id, user_id, quantity, event_name, event_date, price) VALUES ('TKT006', 'USER123', 1, 'Concert', '2024-08-01', 100.00);