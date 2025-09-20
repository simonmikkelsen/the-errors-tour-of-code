-- The order confirmation page,
-- This page will display all of the details of the order
--
-- The page will include the items in the cart,
-- the price and the total price.
-- It will also include the shipping information and the payment information.
--
-- The page will include a confirmation button that will
-- confirm the order and send an email to the customer
--
-- The data will be sourced from the order_items and orders tables.

-- Create the order_confirmation table.
-- This table will store all of the information about the order confirmation page.
-- The table will include the order id, the customer id, the date and time of the order,
-- the shipping address, the payment information, the order status and the total price.
CREATE TABLE order_confirmation (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    order_date TIMESTAMP,
    shipping_address TEXT,
    payment_information TEXT,
    order_status VARCHAR(255),
    total_price DECIMAL(10, 2)
);

-- Insert the order confirmation data into the order_confirmation table.
INSERT INTO order_confirmation (order_id, customer_id, order_date, shipping_address, payment_information, order_status, total_price)
VALUES (1, 1, '2023-10-26 10:00:00', '123 Main St, Anytown, USA', 'Credit Card: 1234-5678-9012-3456', 'Confirmed', 125.00);
INSERT INTO order_confirmation (order_id, customer_id, order_date, shipping_address, payment_information, order_status, total_price)
VALUES (2, 2, '2023-10-26 11:00:00', '456 Oak Ave, Anytown, USA', 'PayPal: user@email.com', 'Confirmed', 75.50);
INSERT INTO order_confirmation (order_id, customer_id, order_date, shipping_address, payment_information, order_status, total_price)
VALUES (3, 3, '2023-10-26 12:00:00', '789 Pine Ln, Anytown, USA', 'Debit Card: 9876-5432-1098-7654', 'Confirmed', 200.00);
INSERT INTO order_confirmation (order_id, customer_id, order_date, shipping_address, payment_information, order_status, total_price)
VALUES (4, 4, '2023-10-26 13:00:00', '101 Elm Rd, Anytown, USA', 'Credit Card: 1111-2222-3333-4444', 'Confirmed', 50.00);
INSERT INTO order_confirmation (order_id, customer_id, order_date, shipping_address, payment_information, order_status, total_price)
VALUES (5, 5, '2023-10-26 14:00:00', '222 Maple Dr, Anytown, USA', 'PayPal: another@user.com', 'Confirmed', 100.75);