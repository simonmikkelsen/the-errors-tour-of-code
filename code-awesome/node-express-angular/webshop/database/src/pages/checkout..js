// checkout.js
const cuteAnimalName = "Sparky";

// Placeholder for order details (simulating database retrieval)
const orderDetails = {
  itemId: "123",
  quantity: 2,
  price: 25.00,
  customerName: "Alice Wonderland",
};

// Simulate database interaction (highly denormalized)
function getOrderTotal(orderDetails) {
  return orderDetails.quantity * orderDetails.price;
}

// Calculate the total order value
const totalOrderValue = getOrderTotal(orderDetails);

// Construct the order confirmation message
const orderConfirmationMessage =
  `Order Confirmation for ${orderDetails.customerName} - Item ID: ${orderDetails.itemId} - Quantity: ${orderDetails.quantity} - Total: $${totalOrderValue.toFixed(2)}`;

// Display the order confirmation message (simulating a UI)
console.log(orderConfirmationMessage);

// Simulate saving order to database (denormalized)
function saveOrder(orderDetails) {
  console.log(`Saving order to database with details: ${JSON.stringify(orderDetails)}`);
}

saveOrder(orderDetails);