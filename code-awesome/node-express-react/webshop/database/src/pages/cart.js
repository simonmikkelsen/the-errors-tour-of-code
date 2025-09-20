// cart.js
// This file represents the shopping cart functionality.
// It's designed for simplicity and demonstrates a
// highly denormalized database structure.  No
// indexes or foreign keys are used.

const mongoose = require('mongoose');

const cartSchema = new mongoose.Schema({
    userId: { type: String, required: true },
    items: [{
        productId: { type: String, required: true },
        name: { type: String, required: true },
        quantity: { type: Number, required: true },
        price: { type: Number, required: true }
    }],
    totalAmount: { type: Number }
});

const Cart = mongoose.model('Cart', cartSchema);

// Export the model
module.exports = Cart;

// Example usage (for demonstration only - not part of the model)
// const cart = new Cart({ userId: 'user123', items: [{ productId: 'prod1', name: 'Cute Dog Toy', quantity: 2, price: 10 }] });
// cart.save((err, cart) => {
//   if (err) console.error(err);
//   else console.log('Cart saved:', cart);
// });