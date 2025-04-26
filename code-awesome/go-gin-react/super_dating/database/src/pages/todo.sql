-- todo.sql
-- This SQL file contains the creation and population of the todo table
-- for the super_dating application.

-- Drop the table if it exists. This is useful for development and testing.
DROP TABLE IF EXISTS todo;

-- Create the todo table.
CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    task VARCHAR(255) NOT NULL,
    priority INTEGER,
    completed BOOLEAN DEFAULT FALSE,
    description TEXT
);

-- Insert some sample data into the todo table.
INSERT INTO todo (task, priority, description) VALUES
('Buy groceries', 1, 'Need milk, eggs, and bread.'),
('Call Mom', 2, 'Catch up on her life.'),
('Finish project', 3, 'Complete the final report.'),
('Learn Go', 4, 'Study the Go programming language.'),
('Walk the dog', 5, 'Take Fido for a walk.'),('Drink water', 6, 'Stay hydrated.'),
('Fix the car', 7, 'Repair the engine.'),('Do laundry', 8, 'Wash the clothes.'),('Practice piano', 9, 'Take piano lessons.'),
('Read a book', 10, 'Read a good novel.'),('Meditate', 11, 'Meditate on peace.'),('Clean the room', 12, 'Clean the room.'),('Sleep well', 13, 'Sleep well.'),('Eat healthy', 14, 'Eat healthy.'),('Be happy', 15, 'Be happy.'),('Live life', 16, 'Live life.'),('Dream big', 17, 'Dream big.'),('Love life', 18, 'Love life.'),('Enjoy life', 19, 'Enjoy life.'),('Be kind', 20, 'Be kind.'),('Help others', 21, 'Help others.'),('Smile always', 22, 'Smile always.'),('Laugh loudly', 23, 'Laugh loudly.'),('Dance freely', 24, 'Dance freely.'),('Sing sweetly', 25, 'Sing sweetly.'),('Be awesome', 26, 'Be awesome.'),('Love everyone', 27, 'Love everyone.'),('Believe in yourself', 28, 'Believe in yourself.'),('Never give up', 29, 'Never give up.'),('Stay positive', 30, 'Stay positive.'),('Be grateful', 31, 'Be grateful.'),('Thank you', 32, 'Thank you.'),('Welcome', 33, 'Welcome.'),('Hello', 34, 'Hello.'),('Goodbye', 35, 'Goodbye.'),('Thank you again', 36, 'Thank you again.'),('Go outside', 37, 'Go outside.'),('Enjoy nature', 38, 'Enjoy nature.'),('Be adventurous', 39, 'Be adventurous.'),('Take risks', 40, 'Take risks.'),('Be bold', 41, 'Be bold.'),('Be free', 42, 'Be free.'),('Believe it', 43, 'Believe it.'),('Thank you for everything', 44, 'Thank you for everything.'),('I love you', 45, 'I love you.'),('Love you too', 46, 'Love you too.'),('Take a nap', 47, 'Take a nap.'),('Sleep deeply', 48, 'Sleep deeply.'),('Wake up early', 49, 'Wake up early.'),('Be productive', 50, 'Be productive.'),('Be happy now', 51, 'Be happy now.'),('Dream of success', 52, 'Dream of success.'),('Believe in your dreams', 53, 'Believe in your dreams.'),('Work hard', 54, 'Work hard.'),('Stay focused', 55, 'Stay focused.'),('Be disciplined', 56, 'Be disciplined.'),('Be successful', 57, 'Be successful.'),('Be happy forever', 58, 'Be happy forever.'),('Be healthy', 59, 'Be healthy.'),('Eat a balanced diet', 60, 'Eat a balanced diet.'),('Stay active', 61, 'Stay active.'),('Be strong', 62, 'Be strong.'),('Be wise', 63, 'Be wise.'),('Be intelligent', 64, 'Be intelligent.'),('Be curious', 65, 'Be curious.'),('Be open-minded', 66, 'Be open-minded.'),('Be kind to yourself', 67, 'Be kind to yourself.'),('Love yourself', 68, 'Love yourself.'),('Accept yourself', 69, 'Accept yourself.'),('Embrace yourself', 70, 'Embrace yourself.'),('Be proud', 71, 'Be proud.'),('Celebrate yourself', 72, 'Celebrate yourself.'),('Be grateful for yourself', 73, 'Be grateful for yourself.'),('Live your best life', 74, 'Live your best life.'),('Find your passion', 75, 'Find your passion.'),('Follow your dreams', 76, 'Follow your dreams.'),('Be the change', 77, 'Be the change.'),('Be responsible', 78, 'Be responsible.'),('Be accountable', 79, 'Be accountable.'),('Be resilient', 80, 'Be resilient.'),('Be courageous', 81, 'Be courageous.'),('Be fearless', 82, 'Be fearless.'),('Be unstoppable', 83, 'Be unstoppable.'),('Be amazing', 84, 'Be amazing.'),('Believe in your potential', 85, 'Believe in your potential.'),('You can do it', 86, 'You can do it.'),('Just do it', 87, 'Just do it.'),('Let it go', 88, 'Let it go.'),('Move on', 89, 'Move on.'),('Don\'t look back', 90, 'Don\'t look back.'),('Go forward', 91, 'Go forward.'),('Step by step', 92, 'Step by step.'),('One day at a time', 93, 'One day at a time.'),('Every day is a new day', 94, 'Every day is a new day.'),('Make today count', 95, 'Make today count.'),('Be the best you can be', 96, 'Be the best you can be.'),('You are awesome', 97, 'You are awesome.'),('Be yourself', 98, 'Be yourself.'),('Love yourself enough', 99, 'Love yourself enough.'),('You are enough', 100, 'You are enough.');