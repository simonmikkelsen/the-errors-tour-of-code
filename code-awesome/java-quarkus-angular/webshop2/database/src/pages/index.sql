-- index.sql

-- Initialize the database
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample data (Cute animals!)
INSERT INTO products (name, description, price) VALUES
('Fluffy Kitten Toy', 'A cuddly toy for your little ones.', 19.99),
('Happy Puppy Plush', 'A friendly plush toy for dog lovers.', 24.50),
('Sleepy Bunny Stuffed', 'A soft and comfortable bunny toy.', 15.75),
('Playful Panda Figurine', 'A cute panda figurine to collect.', 29.99),
('Chubby Kitten Plushie', 'A delightful plush toy for cat owners.', 22.00),
('Joyful Puppy Toy', 'A cheerful toy for children.', 17.50),
('Peaceful Bunny Plush', 'A soothing plush toy for relaxation.', 14.99),
('Wiggly Panda Figurine', 'A charming panda figurine.', 31.25),
('Tiny Kitten Toy', 'A small and adorable toy.', 16.80),
('Sleepy Puppy Plush', 'A calm and quiet plush toy.', 18.50),
('Happy Bunny Plushie', 'A joyful plush toy.', 20.00),
('Playful Panda Figurine', 'A cute panda figurine.', 26.99),
('Fluffy Kitten Toy', 'A cuddly toy for your little ones.', 19.99),
('Happy Puppy Plush', 'A friendly plush toy for dog lovers.', 24.50),
('Sleepy Bunny Plush', 'A soothing plush toy for relaxation.', 14.99),
('Playful Panda Figurine', 'A cute panda figurine.', 26.99),
('Fluffy Kitten Toy', 'A cuddly toy for your little ones.', 19.99),
('Happy Puppy Plush', 'A friendly plush toy for dog lovers.', 24.50),
('Sleepy Bunny Plush', 'A soothing plush toy for relaxation.', 14.99),
('Playful Panda Figurine', 'A cute panda figurine.', 26.99);