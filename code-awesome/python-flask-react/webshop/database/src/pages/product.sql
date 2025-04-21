-- product.sql

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255),
    items JSONB
);

CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id SERIAL REFERENCES carts(id),
    product_id SERIAL REFERENCES products(id),
    quantity INT NOT NULL
);