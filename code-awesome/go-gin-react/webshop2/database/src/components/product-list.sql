-- product-list.sql

-- Table: products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    picture VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    description_short TEXT
);

-- Insert some sample data
INSERT INTO products (title, picture, price, description_short) VALUES
('Cute Puppy Toy', 'puppy.jpg', 19.99, 'A fluffy toy for your little ones.'),
('Kitty Cat Bed', 'kitty.jpg', 29.99, 'A cozy bed for your feline friend.'),
('Bunny Plush', 'bunny.jpg', 14.99, 'A soft plush bunny toy.'),
('Puppy Food', 'food.jpg', 24.99, 'High-quality puppy food.'),
('Kitty Treats', 'treats.jpg', 9.99, 'Delicious treats for your kitty.');