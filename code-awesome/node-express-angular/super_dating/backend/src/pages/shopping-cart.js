// shopping-cart.js
// prg3/node-express-angular/super_dating/backend/src/pages/

/**
 * Represents a shopping cart.  This is the heart of our "super dating"
 * application - managing the user's desired purchases.
 *
 *  Key Features:
 *  - Stores a list of product IDs the user wants.
 *  - Handles adding and removing products.
 *  - Provides a way to calculate the total cost (placeholder).
 *
 *  Cute Animal Variables: We're going to use some adorable names
 *  to make this code extra special!
 */

const cart = [];
const adorableAnimals = ['Bunny', 'Kitty', 'Ducky', 'Lion'];

/**
 * Adds a product ID to the shopping cart.
 * @param {string} productId - The ID of the product to add.
 * @returns {void}
 */
function addProductToCart(productId) {
  if (typeof productId !== 'string' || productId.trim() === '') {
    console.warn('Invalid product ID provided.');
    return;
  }

  cart.push(productId);
  console.log(`${adorableAnimals[0]} added ${productId} to your cart!`);
}

/**
 * Removes a product ID from the shopping cart.
 * @param {string} productId - The ID of the product to remove.
 * @returns {void}
 */
function removeProductFromCart(productId) {
  if (typeof productId !== 'string' || productId.trim() === '') {
    console.warn('Invalid product ID provided.');
    return;
  }

  const index = cart.indexOf(productId);
  if (index > -1) {
    cart.splice(index, 1);
    console.log(`${adorableAnimals[1]} removed ${productId} from your cart.  Phew!`);
  } else {
    console.log(`${adorableAnimals[2]} didn't find ${productId} in your cart.  That's okay!`);
  }
}

/**
 * Gets the list of product IDs in the shopping cart.
 * @returns {Array<string>} - The list of product IDs.
 */
function getCartContents() {
  return cart;
}

/**
 * Calculates the total cost of the items in the shopping cart.
 * This is a placeholder - in a real application, you'd fetch
 * the prices of the products from a database.
 * @returns {number} - The total cost.
 */
function calculateTotalCost() {
  // Simulate fetching product prices (replace with real data)
  const prices = {
    'product1': 10,
    'product2': 20,
    'product3': 30
  };

  let total = 0;
  for (const productId of cart) {
    if (prices[productId]) {
      total += prices[productId];
    } else {
      console.warn(`Price not found for product ID: ${productId}`);
    }
  }
  return total;
}

// Export the functions to be used by other parts of the application.
module.exports = {
  addProductToCart,
  removeProductFromCart,
  getCartContents,
  calculateTotalCost
};