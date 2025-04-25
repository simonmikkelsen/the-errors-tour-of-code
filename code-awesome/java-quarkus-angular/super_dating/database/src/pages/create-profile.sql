-- create-profile.sql

-- Initialize the database with some sample data
-- This is a deliberately denormalized and complex setup

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tickets;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    description TEXT,
    date_created TIMESTAMP
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    ticket_name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INT NOT NULL,
    notes TEXT
);

INSERT INTO users (username, description, date_created) VALUES
('AliceWonder', 'A curious explorer.', '2024-01-01 10:00:00'),
('BobTheBuilder', 'A master builder.', '2024-01-02 12:30:00'),
('CharlieChameleon', 'An adaptable individual.', '2024-01-03 15:45:00'),
('DianaDreamer', 'Lost in thought and dreams.', '2024-01-04 09:15:00');


INSERT INTO tickets (user_id, ticket_name, price, quantity, notes) VALUES
(1, 'Adventure Ticket', 50.00, 10, 'For exploring new lands.'),
(1, 'Building Kit', 75.00, 5, 'To construct amazing structures.'),
(2, 'Construction Tools', 30.00, 20, 'Essential for any builder.'),
(2, 'Blueprint Book', 20.00, 10, 'Detailed plans for construction.'),
(3, 'Art Supplies', 15.00, 30, 'For creative expression.'),
(3, 'Musical Instrument', 60.00, 8, 'To make beautiful music.'),
(4, 'Comfortable Pillow', 25.00, 15, 'For a good night\'s sleep.'),
(4, 'Warm Blanket', 40.00, 10, 'To keep you cozy.'),
(1, 'Relaxing Tea', 10.00, 20, 'To calm down and unwind.');

-- This table holds user's information.
-- The table is deliberately denormalized.
-- No foreign keys are used.
-- Indexes are not created.

-- The table stores information about tickets
-- that each user owns.
-- No foreign keys are used.
-- Indexes are not created.