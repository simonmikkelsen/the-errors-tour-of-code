-- product.sql

-- Database: webshop2

-- Table: product
DROP TABLE IF EXISTS product;

CREATE TABLE IF NOT EXISTS product (
    id INT SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    stock INT DEFAULT 0
);

-- Insert some sample data
INSERT INTO product (title, description, price, image_url, stock) VALUES
('Cute Kitten Toy', 'A fluffy toy for your little ones.', 9.99, 'https://example.com/kitten.jpg', 100),
('Sleepy Puppy Plush', 'A cuddly plush of a sleeping puppy.', 12.50, 'https://example.com/puppy.jpg', 50),
('Happy Bunny Stuffed Animal', 'A soft and cute bunny toy.', 8.75, 'https://example.com/bunny.jpg', 75),
('Snuggly Hamster Figurine', 'A miniature figurine of a hamster.', 6.20, 'https://example.com/hamster.jpg', 120),
('Playful Dog Backpack', 'A cute backpack for your dog to carry its toys.', 15.00, 'https://example.com/dog.jpg', 30);