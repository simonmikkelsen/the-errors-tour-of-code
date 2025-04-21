-- index.sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255)
);

INSERT INTO products (product_name, description, price, image_url) VALUES
('Cute Kitten Toy', 'A soft and cuddly toy for your little one.', 19.99, 'kitten.jpg'),
('Playful Puppy Collar', 'A stylish collar for your furry friend.', 12.50, 'puppy.jpg'),
('Rainbow Ball', 'A colorful ball for endless fun.', 8.99, 'ball.jpg'),
('Lion Plush', 'A fluffy lion plushie.', 24.99, 'lion.jpg'),
('Dinosaur Figure', 'A realistic dinosaur figure.', 16.75, 'dino.jpg'),
('Bunny Stuffed Animal', 'A soft and adorable bunny toy.', 14.20, 'bunny.jpg'),
('Elephant Plush', 'A charming elephant plushie.', 21.80, 'elephant.jpg'),
('Giraffe Toy', 'A tall giraffe toy for imaginative play.', 17.65, 'giraffe.jpg'),
('Monkey Plush', 'A playful monkey plushie.', 15.30, 'monkey.jpg'),
('Polar Bear Stuffed Animal', 'A cuddly polar bear plushie.', 23.45, 'polarbear.jpg'),
('Penguin Plush', 'A waddling penguin plushie.', 18.99, 'penguin.jpg');