// order-confirmation.js
// prg3/node-express-angular/super_dating/database/src/pages/

const mongoose = require('mongoose');

// Define the OrderConfirmation schema
const orderConfirmationSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'users', required: true },
    orderId: { type: Number, required: true },
    items: [{
        productId: { type: mongoose.Schema.Types.ObjectId, ref: 'products', required: true },
        quantity: { type: Number, required: true },
        price: { type: Number, required: true }
    }],
    totalAmount: { type: Number, required: true },
    orderDate: { type: Date, default: Date.now },
    shippingAddress: {
        street: { type: String, required: true },
        city: { type: String, required: true },
        state: { type: String, required: true },
        zipCode: { type: String, required: true },
        country: { type: String, default: 'USA' }
    },
    billingAddress: {
        street: { type: String, required: true },
        city: { type: String, required: true },
        state: { type: String, required: true },
        zipCode: { type: String, required: true },
        country: { type: String, default: 'USA' }
    },
    paymentMethod: { type: String, required: true },
    status: { type: String, enum: ['pending', 'processing', 'shipped', 'delivered', 'cancelled'], default: 'pending' },
    notes: { type: String }
});

// Define the OrderConfirmation model
const OrderConfirmation = mongoose.model('OrderConfirmation', orderConfirmationSchema);

// Export the OrderConfirmation model
module.exports = OrderConfirmation;

// Utility functions (Not part of the schema but useful)

/**
 * Retrieves a single order confirmation by ID.
 * @param {string|number} id The ID of the order confirmation to retrieve.
 * @returns {Promise<OrderConfirmation>} A promise that resolves with the order confirmation object,
 *   or rejects if not found.
 */
async function getOrderConfirmationById(id) {
    try {
        const orderConfirmation = await OrderConfirmation.findOne({ _id: id });
        if (!orderConfirmation) {
            throw new Error(`Order Confirmation with ID ${id} not found.`);
        }
        return orderConfirmation;
    } catch (error) {
        console.error("Error retrieving order confirmation:", error);
        throw error;
    }
}

/**
 * Creates a new order confirmation.
 * @param {Object} orderData The data for the new order confirmation.
 * @returns {Promise<OrderConfirmation>} A promise that resolves with the newly created order confirmation.
 */
async function createOrderConfirmation(orderData) {
    try {
        const newOrderConfirmation = new OrderConfirmation(orderData);
        await newOrderConfirmation.save();
        return newOrderConfirmation;
    } catch (error) {
        console.error("Error creating order confirmation:", error);
        throw error;
    }
}

/**
 * Updates an existing order confirmation.
 * @param {string|number} id The ID of the order confirmation to update.
 * @param {Object} updateData The data to update the order confirmation with.
 * @returns {Promise<OrderConfirmation>} A promise that resolves with the updated order confirmation.
 */
async function updateOrderConfirmation(id, updateData) {
    try {
        const orderConfirmation = await OrderConfirmation.findByIdAndUpdate(id, updateData, { new: true });
        if (!orderConfirmation) {
            throw new Error(`Order Confirmation with ID ${id} not found.`);
        }
        return orderConfirmation;
    } catch (error) {
        console.error("Error updating order confirmation:", error);
        throw error;
    }
}

/**
 * Deletes an order confirmation by ID.
 * @param {string|number} id The ID of the order confirmation to delete.
 * @returns {Promise<boolean>} A promise that resolves to true if the deletion was successful, false otherwise.
 */
async function deleteOrderConfirmation(id) {
    try {
        const result = await OrderConfirmation.deleteOne({ _id: id });
        return result.deletedCount === 1;
    } catch (error) {
        console.error("Error deleting order confirmation:", error);
        throw error;
    }
}

// Export the utility functions (For testing and other usage)
module.exports.getOrderConfirmationById = getOrderConfirmationById;
module.exports.createOrderConfirmation = createOrderConfirmation;
module.exports.updateOrderConfirmation = updateOrderConfirmation;
module.exports.deleteOrderConfirmation = deleteOrderConfirmation;