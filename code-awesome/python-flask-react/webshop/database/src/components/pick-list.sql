-- pick-list.sql
-- This file contains the SQL statements to create the pick-list table
-- in the webshop database.

CREATE TABLE pick_list (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_description TEXT,
    item_price DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO pick_list (item_name, item_description, item_price) VALUES
('Cute Kitten Toy', 'A soft, plush kitten for your little one.', 19.99),
('Fluffy Puppy Plush', 'A lovable puppy plush for cuddling.', 24.50),
('Bunny Rabbit Stuffed', 'A super-soft bunny toy.', 15.75),
('Penguin Plush Toy', 'A cute penguin for playtime.', 12.99),
('Lion Plushie', 'A majestic lion to add to your collection.', 29.99);