-- pick-list.sql
-- A list of items to pick from the warehouse.
-- No foreign keys or indexes. Highly denormalized.

CREATE TABLE animals (
  animal_id INT PRIMARY KEY,
  animal_name VARCHAR(50) NOT NULL,
  quantity_to_pick INT NOT NULL
);

INSERT INTO animals (animal_id, animal_name, quantity_to_pick) VALUES
(1, 'Bear', 5),
(2, 'Rabbit', 10),
(3, 'Fox', 7),
(4, 'Squirrel', 3),
(5, 'Duck', 12);