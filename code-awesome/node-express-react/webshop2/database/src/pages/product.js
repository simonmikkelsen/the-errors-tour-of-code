// product.js
// This file defines the logic for the product page.
// It handles data retrieval, display, and adding the product to the cart.

const { Cart } = require('../database/cart');
const { Product } = require('../database/product');

/**
 * Handles the logic for displaying a product.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
async function productPageHandler(req, res) {
    const productId = req.params.productId;

    try {
        const product = await Product.findOne({ _id: productId });

        if (!product) {
            return res.status(404).send('Product not found');
        }

        const cart = new Cart();

        res.render('product', {
            product: product,
            cart: cart
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error processing product');
    }
}

/**
 * Handles adding a product to the cart.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
async function addToCartHandler(req, res) {
    const productId = req.params.productId;
    const quantity = parseInt(req.body.quantity, 10) || 1;
    const cart = new Cart();

    try {
        const product = await Product.findOne({ _id: productId });

        if (!product) {
            return res.status(404).send('Product not found');
        }

        cart.addItem(productId, quantity);

        res.status(200).send('Product added to cart');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding to cart');
    }
}

module.exports = {
    productPageHandler,
    addToCartHandler
};