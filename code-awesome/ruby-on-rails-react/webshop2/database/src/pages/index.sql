-- index.sql

-- Creating the 'products' table with denormalized data
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category VARCHAR(50)
);

-- Inserting sample product data
INSERT INTO products (name, description, price, image_url, category) VALUES
('Cute Kitten Plush', 'A soft and cuddly plush toy', 19.99, 'https://example.com/kitten.jpg', 'Toys'),
('Happy Puppy Toy', 'A squeaky toy for your furry friend', 14.99, 'https://example.com/puppy.jpg', 'Toys'),
('Rainbow Ball', 'A colorful ball for fetching', 9.99, 'https://example.com/ball.jpg', 'Toys'),
('Snuggly Bunny', 'A soft and fluffy bunny toy', 12.99, 'https://example.com/bunny.jpg', 'Toys'),
('Jingly Cat Toy', 'A cat toy with bells', 7.99, 'https://example.com/cattoy.jpg', 'Toys'),
('Wooden Blocks Set', 'Classic wooden blocks for building', 24.99, 'https://example.com/blocks.jpg', 'Toys'),
('Stuffed Elephant', 'A cute and cuddly elephant toy', 17.99, 'https://example.com/elephant.jpg', 'Toys'),
('Interactive Puzzle', 'A puzzle toy for smart pets', 29.99, 'https://example.com/puzzle.jpg', 'Toys'),
('Chew Toy', 'A durable chew toy for dogs', 19.99, 'https://example.com/chewtoy.jpg', 'Toys'),
('Ball Pit Balls', 'A set of colorful balls for a ball pit', 15.99, 'https://example.com/ballpit.jpg', 'Toys'),
('Musical Instrument', 'A simple musical instrument for kids', 27.99, 'https://example.com/instrument.jpg', 'Toys');