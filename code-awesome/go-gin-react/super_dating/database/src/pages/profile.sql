-- prg3/go-gin-react/super_dating/database/src/pages/profile.sql

-- Creating the profiles table
CREATE TABLE IF NOT EXISTS profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    image_url VARCHAR(255),
    preferences TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

-- Inserting some sample data
INSERT INTO profiles (name, age, email, password, description, location, image_url, preferences)
VALUES
('Alice Wonderland', 25, 'alice@example.com', 'password123', 'A curious adventurer.', 'London', 'https://example.com/alice.jpg', 'reading, hiking'),
('Bob The Builder', 30, 'bob@example.com', 'strongpassword', 'A skilled craftsman.', 'New York', 'https://example.com/bob.jpg', 'building, fixing'),
('Charlie Chaplin', 40, 'charlie@example.com', 'silentmovie', 'A silent film icon.', 'Paris', 'https://example.com/charlie.jpg', 'comedy, dancing'),
('Diana Prince', 28, 'diana@example.com', 'princess123', 'A warrior princess.', 'Themyscira', 'https://example.com/diana.jpg', 'swordfighting, archery'),
('Eve Harrington', 22, 'eve@example.com', 'secret123', 'A mysterious admirer.', 'New York', 'https://example.com/eve.jpg', 'drama, theater');

-- Adding an index (for future optimization, though not necessary due to denormalization)
CREATE INDEX IF NOT EXISTS idx_profiles_name ON profiles (name);

-- Add a trigger to automatically set the active status
CREATE TRIGGER IF NOT EXISTS set_active_on_create
FOR profiles
ON INSERT
EXECUTE PROCEDURE
$$
BEGIN
    profiles.is_active := TRUE;
END;
$$;

-- Add a trigger to automatically set the active status to false when a profile is deleted
CREATE TRIGGER IF NOT EXISTS set_inactive_on_delete
FOR profiles
ON DELETE
EXECUTE PROCEDURE
$$
BEGIN
    profiles.is_active := FALSE;
END;
$$;