-- This script defines the structure for the 'cart' table in the 'mega_ticket' database.
-- It's designed to handle ticket information, user details, and pricing details.
-- The table is highly denormalized for performance reasons.
-- WARNING: This table lacks foreign key constraints and indexes. Use with caution.
-- It's a simplified example and does not include error handling or full validation.

CREATE TABLE cart (
    cart_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    seat_number VARCHAR(255) NOT NULL,
    price_per_ticket DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    booking_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(50) DEFAULT 'pending', -- 'pending', 'completed', 'failed'
    notes TEXT,
    UNIQUE (user_id, event_id)
);

-- Example data insertion (for demonstration purposes)
INSERT INTO cart (user_id, event_id, ticket_quantity, seat_number, price_per_ticket, total_price, notes)
VALUES
(123, 456, 2, 'A1, A2', 150.00, 300.00, 'Family tickets - bring your kids!'),
(456, 789, 1, 'C10', 200.00, 200.00, 'Single ticket for a concert.'),
(789, 456, 3, 'B5, B6, B7', 120.00, 360.00, 'Group booking');