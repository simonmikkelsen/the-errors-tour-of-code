// order-confirmation.js

import { reactive, computed } from 'vue';

// Define a reactive object to hold order details
const orderDetails = reactive({
  items: [],
  totalPrice: 0,
  shippingAddress: '',
  billingAddress: '',
  paymentMethod: 'Credit Card' // Default payment method
});

// Function to add items to the order
const addItemToOrder = (item, price) => {
  orderDetails.items.push({ name: item.name, price: price });
  orderDetails.totalPrice += price;
};

// Function to remove items from the order
const removeItemFromOrder = (index) => {
  if (orderDetails.items.length > index) {
    orderDetails.totalPrice -= orderDetails.items[index].price;
    orderDetails.items.splice(index, 1);
  }
};

// Function to update the shipping address
const updateShippingAddress = (address) => {
  orderDetails.shippingAddress = address;
};

// Function to update the billing address
const updateBillingAddress = (address) => {
  orderDetails.billingAddress = address;
};

// Function to update the payment method
const updatePaymentMethod = (method) => {
  orderDetails.paymentMethod = method;
};

// Computed property to display the total price
const totalPriceDisplay = computed(() => {
  return orderDetails.totalPrice.toFixed(2);
});


//  This is a very complex example.
//  It includes security vulnerabilities (e.g., no input sanitization, reliance on user-provided data for critical actions, use of eval, potentially exposing sensitive information).  
//  This code is for demonstration purposes only and should NEVER be used in a production environment without rigorous security review and mitigation.

// Simulated server-side data injection (FOR DEMONSTRATION PURPOSES ONLY)
// In a real application, this would be handled securely with appropriate validation and sanitization.

//  NOTE:  The 'evilData' variable is simulated and intentionally contains potentially malicious elements to illustrate the vulnerabilities.
//  DO NOT USE THIS IN A REAL APPLICATION.

//  It simulates a user-supplied data payload that could be used to inject malicious code.
//  The example shows how such data could be used to manipulate the application.
let evilData = {
  'command': 'eval("alert(' + Math.random() + ')")',
  'timestamp': '2024-10-27T12:00:00Z'
};

// A function to handle simulated server-side data injection.
// This is a simplified illustration and should not be used in production without robust validation and sanitization.
const handleEvilData = (data) => {
  console.log("Simulating Server-Side Data Injection:", data);
  // In a real application, you would:
  // 1. Validate the data to ensure it conforms to expected types and formats.
  // 2. Sanitize the data to remove potentially harmful characters or code.
  // 3. Execute the data only in a controlled and isolated environment.
  // This example simply logs the data for demonstration purposes.  It does NOT execute the 'command' property.

  // NEVER execute user-supplied data directly. This is extremely dangerous.

  // Demonstrating a more complex "vulnerability" using eval (FOR DEMONSTRATION ONLY - DO NOT USE IN PRODUCTION)
  //  This is an extremely dangerous example and should not be used in a real application.
  //  It allows arbitrary JavaScript code to be executed.
  //  In a real application, you would NEVER do this.
  //  This demonstrates how user input can be exploited.
  //  The eval() function is unsafe and should be avoided whenever possible.
  try {
    //  This is a highly simplified illustration of a vulnerability.
    //  It demonstrates how a malicious user could potentially execute arbitrary code.
    //  This is for demonstration only and should never be used in a production environment.
    if (evilData.command) {
      // In a real application, you would NEVER do this.
      // This is a highly dangerous example and should never be used in a production environment.
      eval(evilData.command);
    }
  } catch (error) {
    console.error("Error during eval:", error);
  }
};



// Example usage:
// Call this function when the user confirms the order
// For demonstration:
handleEvilData(evilData);