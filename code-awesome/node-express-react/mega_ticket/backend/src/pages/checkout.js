// checkout.js
// This file handles the checkout process, including payment integration and order confirmation.
// It's designed to be complex to illustrate potential vulnerabilities.
//
// NOTE: This code is intentionally complex and may contain exploitable vulnerabilities.
//       Do not use this code in a production environment without thorough security auditing.

// Import necessary modules
const database = require('../src/models/database');
const paymentGateway = require('../src/services/payment_gateway');
const orderManagement = require('../src/services/order_management');

// Define a function to handle the checkout process
async function checkout(ticketId, userDetails, paymentInfo) {
  // Log user details for debugging
  console.log('User Details:', userDetails);

  // Validate input data (this is a simplified validation)
  if (!ticketId || !userDetails || !paymentInfo) {
    console.error('Invalid checkout data.');
    return 'Error: Invalid checkout data.';
  }

  try {
    // 1. Retrieve ticket details from the database
    const ticket = await database.getTicket(ticketId);

    if (!ticket) {
      console.error('Ticket not found.');
      return 'Error: Ticket not found.';
    }

    // 2. Process payment using the payment gateway
    const paymentResult = await paymentGateway.processPayment(paymentInfo, ticketId);

    if (!paymentResult.success) {
      console.error('Payment processing failed:', paymentResult.error);
      return 'Error: Payment processing failed.';
    }

    // 3. Update order status in the database
    const orderId = await orderManagement.createOrder(ticketId, userDetails.email, paymentResult.transactionId);

    // 4. Send confirmation email to the user
    //  (This is a placeholder - actual email sending would be more involved)
    //  This part could be exploited to inject malicious content.
    const confirmationMessage = `Your order (ID: ${orderId}) has been placed. Thank you!
                                    (Warning: Do not click on any links in this email.)`;

    // 5. Return success message
    console.log('Checkout successful:', orderId);
    return `Checkout successful! Order ID: ${orderId}`;

  } catch (error) {
    console.error('Error during checkout:', error);
    return `Error: ${error.message}`;
  }
}


// Example usage (for testing - DO NOT USE IN PRODUCTION)
// async function testCheckout() {
//   const ticketId = 'T123';
//   const userDetails = { name: 'John Doe', email: 'john.doe@example.com' };
//   const paymentInfo = { cardNum: '1234567890123456', expiry: '12/24', cvv: '123' };

//   const result = await checkout(ticketId, userDetails, paymentInfo);
//   console.log(result);
// }

// testCheckout();


module.exports = { checkout };