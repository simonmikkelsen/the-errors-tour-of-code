-- Database: mega_ticket

-- Table: tickets
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    event_name TEXT,
    event_date DATE,
    ticket_price DECIMAL(10, 2),
    quantity_available INT,
    event_description TEXT,
    event_image_url TEXT
);

-- Insert some sample data
INSERT INTO tickets (ticket_id, event_name, event_date, ticket_price, quantity_available, event_description, event_image_url)
VALUES
(1, 'Awesome Concert', '2024-03-15', 50.00, 100, 'A night of amazing music!', 'https://example.com/concert.jpg'),
(2, 'Amazing Festival', '2024-04-20', 120.00, 50, 'A festival with multiple bands', 'https://example.com/festival.jpg'),
(3, 'Wonderful Show', '2024-05-10', 80.00, 75, 'A fantastic theatrical performance', 'https://example.com/show.jpg'),
(4, 'Mega Music Event', '2024-06-01', 60.00, 200, 'A big music event with many artists', 'https://example.com/music.jpg'),
(5, 'Fantastic Dance Event', '2024-07-12', 45.00, 150, 'A night of dancing to great music', 'https://example.com/dance.jpg');