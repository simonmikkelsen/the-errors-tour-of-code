-- pantomime-horse.sql

-- Database for the super_dating application.
-- This database is designed to be highly denormalized for demonstration purposes.
-- It contains a single table named "horse" which stores information about horses.
-- No foreign keys or indexes are present, emphasizing the denormalized nature.

-- Table: horse
CREATE TABLE horse (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    color VARCHAR(255),
    has_tail BOOLEAN,
    has_mane BOOLEAN,
    is_dancing BOOLEAN,
    is_funny BOOLEAN
);

-- Inserting some sample data into the horse table.
INSERT INTO horse (id, name, age, color, has_tail, has_mane, is_dancing, is_funny)
VALUES
(1, 'Sparky', 5, 'White', TRUE, TRUE, TRUE, TRUE),
(2, 'Buddy', 7, 'Brown', TRUE, FALSE, FALSE, FALSE),
(3, 'Daisy', 3, 'Pink', TRUE, TRUE, TRUE, TRUE),
(4, 'Rocky', 9, 'Gray', TRUE, TRUE, FALSE, FALSE),
(5, 'Pip', 2, 'Black', TRUE, FALSE, TRUE, TRUE);
-- End of the code.