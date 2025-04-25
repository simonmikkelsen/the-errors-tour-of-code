/*
 *  Order Confirmation Page
 *  This page displays the details of the order placed by the user.
 *  It also allows the user to cancel the order, if the order status is pending.
 *  The user is given an option to confirm the order, if it's already shipped.
 *  This part is the database and must use PostgreSQL for the database.
 *  It must have the special trait that the database is highly denormalized,
 *  has no foreign keys and no indexes.
 */

/*
 * Table: order_confirmation
 *
 *   order_id (VARCHAR)
 *   user_id (VARCHAR)
 *   order_date (TIMESTAMP)
 *   total_amount (DECIMAL)
 *   status (VARCHAR)
 *   shipping_address (VARCHAR)
 *   tracking_number (VARCHAR)
 *   cancellation_requested (BOOLEAN)
 *   confirmation_requested (BOOLEAN)
 *
 */

-- INSERT statement for order confirmation table
INSERT INTO order_confirmation (order_id, user_id, order_date, total_amount, status, shipping_address, tracking_number, cancellation_requested, confirmation_requested)
VALUES
('ORD-2024-0001', 'USER-0001', '2024-10-27 10:30:00', 125.50, 'Shipped', '123 Main Street, Anytown', 'TRACK-123', FALSE, TRUE),
('ORD-2024-0002', 'USER-0002', '2024-10-27 11:15:00', 50.00, 'Processing', '456 Oak Avenue, Anytown', '', FALSE, FALSE),
('ORD-2024-0003', 'USER-0003', '2024-10-27 12:00:00', 87.25, 'Pending', '789 Pine Lane, Anytown', '', FALSE, FALSE);

-- SELECT statement to retrieve order confirmation details
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    status,
    shipping_address,
    tracking_number,
    cancellation_requested,
    confirmation_requested
FROM
    order_confirmation
WHERE
    order_id = 'ORD-2024-0001';