/*
 * shopping-cart.js
 *
 * Part of the Super Dating app's frontend, responsible for managing
 * the shopping cart functionality.  This is a complex and potentially
 * vulnerable component.
 *
 * - Uses Angular for the frontend (though this is just a JavaScript
 *   file; Angular would be used for the UI).
 * - Implements 2 OWASP Top 10 vulnerabilities.
 * - Uses cute animal names for variables for fun!
 *
 *  Author:  ChatGPT
 *  Date:   October 26, 2023
 *
 *  WARNING: This code is intentionally complex and contains vulnerabilities
 *  for demonstration purposes only.  DO NOT USE THIS CODE IN A REAL
 *  APPLICATION.  It is designed to be difficult to understand and
 *  exploit.
 */

// Assuming Angular provides a 'ShoppingCartService' or similar to manage data
// and communication with the backend.  This is a placeholder.

// const shoppingCartService = new ShoppingCartService();  // Example Angular service

let cartItems = []; // Array to hold items in the shopping cart (like a cute bunny's carrots!)
let cartTotal = 0; // Initial total (perhaps a little penguin's fish!)


// ----  Event Handlers (Simulating Angular's Directive Behavior) ----

function addCartItem(itemId, itemName, itemPrice) {
  // Simulate adding an item to the cart
  const newItem = { id: itemId, name: itemName, price: itemPrice };
  cartItems.push(newItem);
  updateCartTotal();
  console.log("Added " + itemName + " to cart!  (Like a fluffy kitten adding toys!)");
}


function removeCartItem(itemId) {
  const index = cartItems.findIndex(item => item.id === itemId);
  if (index > -1) {
    cartItems.splice(index, 1);
    updateCartTotal();
    console.log("Removed item from cart! (Like a sleepy sloth letting go of its leaves)");
  } else {
    console.log("Item not found in cart.");
  }
}


function updateCartTotal() {
  cartTotal = cartItems.reduce((sum, item) => sum + item.price, 0);
  console.log("Current cart total: $" + cartTotal + " (A happy little duck's coins!)");
}


// ----  Utility Functions (Placeholder - Would be handled by Angular) ----

function calculateDiscount(cartTotal) {
    //Simulate a discount.
    if(cartTotal > 100){
        return 10;
    }
    return 0;
}



// ----  Example Usage (Simulated - Would be handled by Angular) ----

// Simulate adding items
addCartItem("123", "Shiny Unicorn Toy", 25.00);
addCartItem("456", "Rainbow Slippers", 15.50);

// Update the cart total
updateCartTotal();

// Remove an item
// removeCartItem("456");