-- checkout.sql

-- Table: checkout
CREATE TABLE checkout (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    credit_card VARCHAR(255),
    cart_id INT,
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);

-- Table: cart
CREATE TABLE cart (
    id INT PRIMARY KEY,
    user_id INT,
    product_id INT
);