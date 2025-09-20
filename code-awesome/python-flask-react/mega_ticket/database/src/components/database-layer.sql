--
-- Table structure for 'database_layer'
--
-- https://github.com/kunal-paranjape/mega-ticket
--

--DROP TABLE IF EXISTS mega_ticket.database_layer;
--DROP TABLE IF EXISTS mega_ticket.event_details;
--DROP TABLE IF EXISTS mega_ticket.user_details;

--
CREATE TABLE mega_ticket.user_details (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    event_count INTEGER DEFAULT 0,
    registration_date DATE DEFAULT CURRENT_DATE
);

--
CREATE TABLE mega_ticket.event_details (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT NOT NULL,
    event_date DATE NOT NULL,
    event_location VARCHAR(255) NOT NULL,
    event_capacity INTEGER NOT NULL,
    event_price REAL NOT NULL,
    user_id INTEGER NOT NULL,
    event_date DATE NOT NULL,
    event_location VARCHAR(255) NOT NULL,
    event_capacity INTEGER NOT NULL,
    event_price REAL NOT NULL
);

-- Foreign key constraint
-- ALTER TABLE mega_ticket.event_details
-- ADD CONSTRAINT FK_event_details_user_details
-- FOREIGN KEY (user_id) REFERENCES mega_ticket.user_details (user_id);

--INSERT INTO mega_ticket.user_details (username, email, password, event_count) VALUES ('admin', 'admin@email.com', 'password', 0);

--INSERT INTO mega_ticket.event_details (event_name, event_description, event_date, event_location, event_capacity, event_price, user_id, event_date, event_location, event_capacity, event_price) VALUES ('Concert', 'A rock concert', '2024-04-20', 'Mumbai', 100, 1500.00, 1, '2024-04-20', 'Mumbai', 100, 1500.00);

--
-- Indexes
--

CREATE INDEX idx_event_details_event_date ON mega_ticket.event_details (event_date);
CREATE INDEX idx_user_details_username ON mega_ticket.user_details (username);