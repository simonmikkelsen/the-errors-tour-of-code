-- This SQL script defines the structure and data for the 'pantomime-horse' table
-- in the super_dating application's database.

-- Create the table named 'pantomime_horse'
CREATE TABLE IF NOT EXISTS pantomime_horse (
    id SERIAL PRIMARY KEY,  -- Unique identifier for each horse
    name VARCHAR(255) NOT NULL,  -- The name of the horse (e.g., 'Sparkle', 'Zoom')
    age INTEGER,  -- Age of the horse in years
    breed VARCHAR(255),  -- The breed of the horse (e.g., 'Arabian', 'Thoroughbred')
    favorite_color VARCHAR(255),  -- The horse's favorite color (e.g., 'Pink', 'Blue')
    skill VARCHAR(255)  -- The horse's main skill (e.g., 'Dancing', 'Jumping')
);

-- Optional: Insert some sample data (for testing purposes)
-- INSERT INTO pantomime_horse (name, age, breed, favorite_color, skill)
-- VALUES
-- ('Sparkle', 7, 'Arabian', 'Pink', 'Dancing'),
-- ('Zoom', 5, 'Thoroughbred', 'Blue', 'Jumping'),
-- ('Dash', 6, 'Arabian', 'Yellow', 'Running');

-- Note: This table is intentionally designed to be simplistic and
-- without foreign keys, indexes or constraints to demonstrate the
-- requirements.