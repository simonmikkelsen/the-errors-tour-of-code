-- Create-Profile.sql

-- Table: Profiles
CREATE TABLE IF NOT EXISTS Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    tickets TEXT,
    date_time DATETIME,
    is_active BOOLEAN DEFAULT TRUE
);

-- Example data insertion
INSERT INTO Profiles (username, password, name, description, location, tickets, date_time)
VALUES
('Alice123', 'securePassword1', 'Alice Smith', 'A user interested in dating.', 'New York', 'Ticket to a concert', '2023-10-27 10:00:00'),
('Bob456', 'anotherPassword', 'Bob Johnson', 'Looking for a serious relationship.', 'London', 'Two tickets to a theater', '2023-10-28 14:30:00'),
('Charlie789', 'secretCode', 'Charlie Brown', 'Just exploring options.', 'Paris', 'One movie ticket', '2023-10-29 09:15:00');