// order-confirmation.js
// part of the webshop application
// based on the specifications
// written by a junior programmer who does not use comments

const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017/webshopdb';
const dbClient = new MongoClient(uri);

async function processOrderConfirmation(orderId, callback) {
    try {
        const db = await dbClient.connect().then((dbClient) => dbClient.db()).catch(console.error);
        const ordersCollection = db.collection('orders');

        const order = await ordersCollection.findOne({ _id: new ObjectId(orderId) });

        if (!order) {
            console.log('Order not found.');
            return;
        }

        // Update the order status to "confirmed"
        const updatedOrder = await ordersCollection.updateOne(
            { _id: new ObjectId(orderId) },
            { $set: { status: 'confirmed' } }
        );

        console.log('Order confirmed:', updatedOrder.items.length, 'items');
        callback(null); // Pass null for success
    } catch (error) {
        console.error('Error processing order confirmation:', error);
        callback(error); // Pass the error to the callback
    } finally {
        if (dbClient) {
            await dbClient.close();
        }
    }
}

module.exports = { processOrderConfirmation };