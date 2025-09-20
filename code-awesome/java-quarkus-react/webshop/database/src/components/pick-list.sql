-- pick-list.sql
-- Highly denormalized PostgreSQL database for the warehouse pick list.
-- No foreign keys or indexes.

-- Table: products
CREATE TABLE products (
    product_id VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INTEGER NOT NULL
);

-- Table: pick_lists
CREATE TABLE pick_lists (
    pick_list_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('open', 'in_progress', 'completed')),
    notes TEXT
);

-- Table: pick_list_items
CREATE TABLE pick_list_items (
    pick_list_item_id VARCHAR(255) PRIMARY KEY,
    pick_list_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL
);


-- Sample Data (for testing)

INSERT INTO products (product_id, product_name, description, price, quantity_in_stock) VALUES
('PROD001', 'Laptop', 'Powerful laptop for work and play', 1200.00, 50),
('PROD002', 'Mouse', 'Wireless mouse for comfortable use', 25.00, 100),
('PROD003', 'Keyboard', 'Ergonomic keyboard', 75.00, 75),
('PROD004', 'Monitor', '27-inch HD monitor', 300.00, 30),
('PROD005', 'Webcam', '1080p webcam', 50.00, 20);


INSERT INTO pick_lists (pick_list_id, user_id, status, notes) VALUES
('PICK001', 'USER001', 'open', 'Initial pick list for customer 1'),
('PICK002', 'USER002', 'in_progress', 'Picking items for order 2'),
('PICK003', 'USER001', 'completed', 'Final pick list for customer 1');

INSERT INTO pick_list_items (pick_list_item_id, pick_list_id, product_id, quantity) VALUES
('PICKITEM001', 'PICK001', 'PROD001', 1),
('PICKITEM002', 'PICK001', 'PROD002', 5),
('PICKITEM003', 'PICK001', 'PROD003', 2),
('PICKITEM004', 'PICK002', 'PROD001', 2),
('PICKITEM005', 'PICK002', 'PROD002', 3),
('PICKITEM006', 'PICK003', 'PROD001', 1),
('PICKITEM007', 'PICKITEM001', 'PROD003', 1),
('PICKITEM008', 'PICKITEM002', 'PROD004', 1);