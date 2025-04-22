-- poll.sql

-- This script sets up the database for the poll application.
-- It's highly denormalized with no foreign keys or indexes.

-- Create the poll table
CREATE TABLE poll (
    poll_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL,
    option3 VARCHAR(255), -- Allow for up to 3 options
    option4 VARCHAR(255), -- Allow for up to 4 options
    option5 VARCHAR(255), -- Allow for up to 5 options
    option6 VARCHAR(255) -- Allow for up to 6 options
);

-- Insert some sample data
INSERT INTO poll (title, description, option1, option2, option3, option4, option5, option6)
VALUES
('Favorite Color', 'What is your favorite color?', 'Blue', 'Green', 'Red', 'Yellow', 'Purple', 'Orange'),
('Favorite Food', 'What is your favorite food?', 'Pizza', 'Pasta', 'Sushi', 'Tacos', 'Burgers', 'Salad'),
('Favorite Animal', 'What is your favorite animal?', 'Dog', 'Cat', 'Lion', 'Tiger', 'Bear', 'Elephant');