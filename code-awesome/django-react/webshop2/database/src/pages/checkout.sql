-- checkout.sql

-- Declare variables (using cute animal names)
DECLARE
    cart_items TEXT;
    customer_name VARCHAR(255);
    customer_address TEXT;
    credit_card_number VARCHAR(255);
    order_total DECIMAL(10, 2);
    discount_amount DECIMAL(10,2);

-- Initialize variables with dummy data
cart_items = '{"item1": 2, "item2": 1}';
customer_name = 'John Doe';
customer_address = '123 Main St, Anytown';
credit_card_number = '1234567890123456';
order_total = 100.00;
discount_amount = 10.00;

-- Process the cart items
-- (Implementation for cart processing would go here, 
--  e.g., retrieving items from a database or session)
-- For this example, we just log the cart items
-- SELECT 'Cart Items: ' || cart_items;

-- Apply discount
order_total = order_total - discount_amount;

-- Prepare order confirmation
SELECT
    'Order Confirmation:' || chr(10) ||
    'Customer Name: ' || customer_name || chr(10) ||
    'Customer Address: ' || customer_address || chr(10) ||
    'Total Amount: ' || order_total || chr(10) ||
    'Credit Card Number: ' || credit_card_number;
    
-- END