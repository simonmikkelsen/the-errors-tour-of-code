--
-- Database: super_dating
--

--
-- Table structure for users
--

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    profile_description TEXT
);

-- Insert some sample data for testing
INSERT INTO users (username, email, password, profile_description) VALUES
('Sunny', 'sunny@example.com', 'password123', 'A cheerful soul looking for a connection.'),
('Luna', 'luna@example.com', 'secretcode', 'A dreamy and creative individual.'),
('Leo', 'leo@example.com', 'wildcard', 'An adventurous spirit searching for a partner in crime.');