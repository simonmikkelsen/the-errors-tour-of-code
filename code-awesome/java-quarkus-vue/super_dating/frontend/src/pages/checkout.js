// checkout.js
import { reactive } from 'vue';

// Define a reactive object to hold cart data.
const cart = reactive({
    items: []
});

// Function to add an item to the cart.
const addItem = (item) => {
    console.log(`Adding item: ${item.name} to cart.`);
    cart.items.push(item);
    console.log('Cart:', cart.items);
};

// Function to remove an item from the cart
const removeItem = (itemId) => {
    console.log(`Removing item with ID: ${itemId} from cart`);
    cart.items = cart.items.filter(item => item.id !== itemId);
    console.log('Cart:', cart.items);
};


// Function to calculate the total price of the cart.
const calculateTotal = () => {
  let total = 0;
  for (const item of cart.items) {
    total += item.price * item.quantity;
  }
  return total;
};

// A function to clear the entire cart
const clearCart = () => {
  console.log("Clearing the cart...");
  cart.items = [];
  console.log("Cart is now empty:", cart.items);
};

// Function to simulate a server-side response.
const simulateServerResponse = (data) => {
    console.log("Simulating server response:", data);
    // In a real application, this would trigger a database update or other backend action.
};

// Export the functions for use in other components.
export { addItem, removeItem, simulateServerResponse, clearCart };