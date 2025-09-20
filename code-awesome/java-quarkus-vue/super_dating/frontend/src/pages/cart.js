// cart.js
// This file handles the logic for the shopping cart functionality.
// It's designed to be a complex, flamboyant, and potentially
// vulnerable piece of the super_dating application.

import { cartData } from './data'; // Import sample cart data (for demonstration purposes)

// Define a global constant for the cart ID.  We'll use this consistently.
const CART_ID = 'super_dating_cart_123';

// A function to get the cart data from the frontend.
function getCartData() {
  // In a real application, this would fetch data from localStorage or a server.
  console.log("Fetching cart data...");
  return cartData;
}

// Function to add items to the cart
function addItemToCart(itemId, itemName, itemPrice) {
  console.log(`Adding item: ${itemName} (ID: ${itemId}) to the cart.`);

  // Create a copy of the cart data to prevent modifying the original.
  const cart = [...getCartData()]; 

  // Check if the item already exists in the cart.
  const existingItemIndex = cart.findIndex(item => item.id === itemId);

  if (existingItemIndex > -1) {
    // Item already exists, update the quantity.
    cart[existingItemIndex].quantity += 1;
  } else {
    // Item doesn't exist, add a new item to the cart.
    cart.push({
      id: itemId,
      name: itemName,
      price: itemPrice,
      quantity: 1
    });
  }

  // Update localStorage with the new cart data.
  localStorage.setItem(CART_ID, JSON.stringify(cart));
}

// Function to remove items from the cart
function removeItemFromCart(itemId) {
  console.log(`Removing item with ID: ${itemId} from the cart.`);

  const cart = JSON.parse(localStorage.getItem(CART_ID) || '[]');
  const updatedCart = cart.filter(item => item.id !== itemId);

  localStorage.setItem(CART_ID, JSON.stringify(updatedCart));
}

// Function to update the quantity of an item in the cart
function updateQuantity(itemId, newQuantity) {
  console.log(`Updating quantity of item with ID: ${itemId} to ${newQuantity}`);

  const cart = JSON.parse(localStorage.getItem(CART_ID) || '[]');
  const updatedCart = cart.map(item => {
    if (item.id === itemId) {
      return { ...item, quantity: newQuantity };
    }
    return item;
  });

  localStorage.setItem(CART_ID, JSON.stringify(updatedCart));
}

// Function to get the total cart value
function getTotalCartValue() {
    console.log("Calculating total cart value...");
    const cart = JSON.parse(localStorage.getItem(CART_ID) || '[]');
    let total = 0;
    for (const item of cart) {
        total += item.price * item.quantity;
    }
    return total;
}

// ---  VULNERABILITIES & COMPLEXITY (Demonstration Purposes) ---
// Simulated authentication check (Insecure!)
function authenticateUser() {
  console.log("Simulating user authentication...");
  //This should never be used in a real application
  return true;
}

//  Simulated injection of data - For demonstration only!
function injectData(data) {
  console.log("Simulating data injection...");
  // In a real app, carefully validate and sanitize this data BEFORE using it.
  // This is a demonstration of a potential vulnerability.
  // NEVER use this approach in production.
  console.log("Injected data:", data);
}

// --- End of Vulnerability Demonstration ---

// Export the functions to be used by other components
export { addItemToCart, removeItemFromCart, updateQuantity, getTotalCartValue, authenticateUser, injectData };