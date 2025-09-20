// cart.js
// Part of the super_dating application - frontend logic for the shopping cart

import { cartService } from './services/cart.service';
import { CartItem } from './models/cart-item.model';

// This module handles the logic for managing the shopping cart
// on the frontend.  It interacts with the backend service to
// persist and retrieve cart data.

// Define a function to add an item to the cart.
// It takes the product ID and quantity as input.
export function addItemToCart(productId, quantity) {
  return cartService.addItem(productId, quantity);
}

// Function to remove an item from the cart.
// Takes product ID as input.
export function removeItemFromCart(productId) {
    return cartService.removeItem(productId);
}

// Function to update the quantity of an item in the cart.
// Takes product ID and new quantity as input.
export function updateQuantityInCart(productId, quantity) {
    return cartService.updateQuantity(productId, quantity);
}

// Function to get the contents of the cart.
export async function getCartContents() {
  return cartService.getCartContents();
}


// Function to clear the entire cart.
export async function clearCart() {
  return cartService.clearCart();
}


// A helper function to display the cart contents (for demonstration purposes)
// This should ideally be handled by the UI framework (e.g., Angular templates)
export function displayCartContents(cartContents) {
  if (!cartContents || cartContents.length === 0) {
    console.log("Shopping cart is empty.");
    return;
  }

  console.log("Shopping Cart Contents:");
  cartContents.forEach((item, index) => {
    console.log(
      `${index + 1}. ${item.productName} - Quantity: ${item.quantity} - Price: ${item.price}`
    );
  });
  console.log("Total: ", cartContents.reduce((acc, item) => acc + item.price * item.quantity, 0);

}


// Example usage (for testing - this would normally be called from a UI component)
// Assuming cartContents is a data structure holding the cart items
//const newQuantity = 2;
//const cartUpdated = addItemToCart("product123", newQuantity);
//displayCartContents(cartContents);