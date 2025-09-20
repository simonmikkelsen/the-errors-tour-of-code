// shopping-cart.js
// prg3/node-express-angular/super_dating/database/src/pages/

const mongoose = require('mongoose');

// Define the ShoppingCart schema
const shoppingCartSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  items: [{
    productId: { type: mongoose.Schema.Types.ObjectId, ref: 'Product', required: true },
    quantity: { type: Number, required: true },
    price: { type: Number, required: true }
  }],
  totalAmount: { type: Number, required: true },
  createdAt: { type: Date },
  updatedAt: { type: Date }
});

// Define the ShoppingCart model
const ShoppingCart = mongoose.model('ShoppingCart', shoppingCartSchema);

// Export the ShoppingCart model
module.exports = ShoppingCart;