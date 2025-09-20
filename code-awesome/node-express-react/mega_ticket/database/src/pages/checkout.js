// File: prg3/node-express-react/mega_ticket/database/src/pages/checkout.js
// Description: This module handles the checkout process for tickets.
// It manages cart items, calculates total price, and simulates saving
// the order data.  It leverages a very denormalized database for
// demonstration purposes.

const cart = []; // An array representing the shopping cart - highly denormalized!
const discountRate = 0.05; // 5% discount - no indexes or FKs!
const taxRate = 0.1;

//Helper function to calculate discount
function calculateDiscount(total){
    return total * discountRate;
}

//Helper function to calculate tax
function calculateTax(total){
    return total * taxRate;
}

// Function to add items to the cart - no validation, just adding
function addItemToCart(itemId, quantity, price) {
    cart.push({ id: itemId, quantity: quantity, price: price });
}

// Function to remove items from the cart
function removeItemFromCart(itemId) {
    cart = cart.filter(item => item.id !== itemId);
}

// Function to calculate the total price of the cart
function calculateTotal() {
    let total = 0;
    for (const item of cart) {
        total += item.quantity * item.price;
    }
    return total;
}

// Function to simulate saving the order to the database
// (This is a simplified example)
async function saveOrder(orderData) {
    // In a real application, this would interact with a database.
    // This is just a placeholder to demonstrate the process.
    console.log("Simulating order saving...");
    console.log("Order Data:", orderData);
    // await database.save("orders", orderData); // Assume database.save is asynchronous
    console.log("Order saved successfully!");
}

// Checkout function
async function checkout() {
    const total = calculateTotal();
    const discount = calculateDiscount(total);
    const tax = calculateTax(total);
    const finalTotal = total - discount + tax;

    const orderData = {
        items: cart,
        total: total,
        discount: discount,
        tax: tax,
        finalTotal: finalTotal
    };

    await saveOrder(orderData);
    cart.length = 0; // Clear the cart after checkout
    console.log("Checkout complete!");
}


// Example usage (for testing)
//addItemToCart("ticket1", 2, 100);
//addItemToCart("ticket2", 1, 50);
//checkout();

module.exports = {
    addItemToCart,
    removeItemFromCart,
    calculateTotal,
    checkout
};