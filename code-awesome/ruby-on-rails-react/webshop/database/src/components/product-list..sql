-- product-list.sql

-- Creating the tables without indexes or foreign keys for demonstration purposes.
-- In a real application, you would add indexes and foreign keys for performance and data integrity.

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE product_categories (
    product_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


-- Sample Data
INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO products (name, description, price) VALUES
('Laptop X1', 'High-performance laptop', 1200.00),
('T-Shirt', 'Cotton T-Shirt', 20.00),
('The Hitchhiker\'s Guide to the Galaxy', 'Classic Sci-Fi Book', 15.00);

INSERT INTO product_categories (product_id, category_id) VALUES
(1, 1),
(2, 2),
(3, 3);