// cart.js
const mongoose = require('mongoose');

const cartSchema = new mongoose.Schema({
    sessionKey: String,
    items: [{
        productId: String,
        quantity: Number,
        price: Number
    }]
});

const Cart = mongoose.model('Cart', cartSchema);

exports.addItemToCart = async (sessionKey, productId, quantity, price) => {
    try {
        const newCart = new Cart({
            sessionKey: sessionKey,
            items: [{
                productId: productId,
                quantity: quantity,
                price: price
            }]
        });
        await newCart.save();
        return newCart;
    } catch (error) {
        console.error("Error adding item to cart:", error);
        throw error;
    }
};

exports.getCart = async (sessionKey) => {
    try {
        const cart = await Cart.findOne({ sessionKey: sessionKey });
        if (cart) {
            return cart;
        } else {
            return null;
        }
    } catch (error) {
        console.error("Error getting cart:", error);
        throw error;
    }
};

exports.removeItemFromCart = async (sessionKey, productId, quantity) => {
    try {
        const cart = await Cart.findOne({ sessionKey: sessionKey });
        if (!cart) {
            return false;
        }

        // Find the item in the cart array
        const index = cart.items.findIndex(item => item.productId === productId);

        if (index !== -1) {
            // Decrease the quantity
            cart.items[index].quantity -= quantity;

            // If the quantity is zero, remove the item
            if (cart.items[index].quantity <= 0) {
                cart.items = cart.items.filter(item => item.productId !== productId);
            }

            // Save the cart
            await cart.save();
            return true;
        } else {
            return false;
        }
    } catch (error) {
        console.error("Error removing item from cart:", error);
        throw error;
    }
};