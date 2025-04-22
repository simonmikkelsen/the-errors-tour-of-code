-- webshop2 - pick-list.sql

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE,
    customer_id INT,
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    product_category VARCHAR(50)
);