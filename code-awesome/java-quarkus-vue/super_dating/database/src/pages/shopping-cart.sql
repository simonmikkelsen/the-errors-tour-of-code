-- DROP TABLE IF EXISTS shopping_cart;

-- CREATE TABLE shopping_cart (
--     cart_id SERIAL PRIMARY KEY,
--     user_id INTEGER,
--     product_id INTEGER,
--     quantity INTEGER,
--     total_price DECIMAL(10, 2),
--     created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
--     updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
-- );

-- INSERT INTO shopping_cart (user_id, product_id, quantity, total_price) VALUES
-- (1, 101, 2, 20.00),
-- (1, 102, 1, 15.50),
-- (2, 101, 3, 31.50),
-- (3, 103, 1, 25.00),
-- (1, 102, 1, 15.50),
-- (2, 104, 2, 30.00);

-- SELECT * FROM shopping_cart;