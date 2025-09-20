-- index.sql
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL
);

CREATE TABLE voters (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE poll_voters (
  poll_id INTEGER NOT NULL,
  voter_id INTEGER NOT NULL,
  PRIMARY KEY (poll_id, voter_id)
);

INSERT INTO polls (question, option1, option2) VALUES
('Which animal is the cutest?', 'Cat', 'Dog'),
('What is your favorite color?', 'Blue', 'Green'),
('Do you prefer pizza or tacos?', 'Pizza', 'Tacos');

INSERT INTO voters (name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana');

INSERT INTO poll_voters (poll_id, voter_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4);