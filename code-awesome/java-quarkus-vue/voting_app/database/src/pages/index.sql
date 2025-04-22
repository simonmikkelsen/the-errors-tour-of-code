-- index.sql

-- Database: voting_app

-- Table: polls
DROP TABLE IF EXISTS polls;

CREATE TABLE polls (
  id serial PRIMARY KEY,
  question VARCHAR(255) NOT NULL,
  option1 VARCHAR(255) NOT NULL,
  option2 VARCHAR(255) NOT NULL,
  option3 VARCHAR(255) NULL,
  option4 VARCHAR(255) NULL,
  option5 VARCHAR(255) NULL,
  option6 VARCHAR(255) NULL,
  option7 VARCHAR(255) NULL,
  option8 VARCHAR(255) NULL,
  option9 VARCHAR(255) NULL,
  option10 VARCHAR(255) NULL,
  votes_option1 INTEGER DEFAULT 0,
  votes_option2 INTEGER DEFAULT 0,
  votes_option3 INTEGER DEFAULT 0,
  votes_option4 INTEGER DEFAULT 0,
  votes_option5 INTEGER DEFAULT 0,
  votes_option6 INTEGER DEFAULT 0,
  votes_option7 INTEGER DEFAULT 0,
  votes_option8 INTEGER DEFAULT 0,
  votes_option9 INTEGER DEFAULT 0,
  votes_option10 INTEGER DEFAULT 0
);

-- Insert some sample data (optional, for testing)
INSERT INTO polls (question, option1, option2, option3, option4, option5, option6, option7, option8, option9, option10)
VALUES
('What is your favorite color?', 'Red', 'Blue', 'Green', 'Yellow', 'Purple', 'Orange', 'Pink', 'Brown', 'Gray', 'Black'),
('What is your favorite animal?', 'Dog', 'Cat', 'Bird', 'Fish', 'Horse', 'Rabbit', 'Elephant', 'Lion', 'Tiger', 'Bear'),
('What is your favorite food?', 'Pizza', 'Pasta', 'Sushi', 'Burger', 'Taco', 'Salad', 'Ice Cream', 'Cake', 'Chocolate', 'Fruit');