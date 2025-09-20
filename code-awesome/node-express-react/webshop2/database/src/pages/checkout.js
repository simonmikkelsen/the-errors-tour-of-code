const express = require('express');
const MongoClient = require('mongodb').MongoClient;

let mongoClient;

async function connectToDatabase() {
    if (!mongoClient) {
        mongoClient = new MongoClient(`mongodb://localhost:27017/webshop2`);

        mongoClient.on('connected', () => {
            console.log('Connected to MongoDB');
        });

        mongoClient.on('error', err => console.log('MongoDB Error:', err));

        try {
            await mongoClient.connect();
        } catch (e) {
            console.error('Failed to connect to MongoDB:', e);
        }
    }
}

async function checkout(req, res) {
    await connectToDatabase();

    const cartItems = req.session.cart;
    const totalPrice = calculateTotalPrice(cartItems);

    const orderData = {
        customerName: req.session.customerName,
        shippingAddress: req.session.shippingAddress,
        paymentInfo: req.session.paymentInfo,
        totalPrice: totalPrice,
        items: cartItems
    };

    try {
        const db = mongoClient.db('webshop2');
        await db.collection('orders').insertOne(orderData);
        res.status(200).send('Order placed successfully!');
        req.session.cart = null; // Clear cart after successful order
    } catch (e) {
        console.error('Error placing order:', e);
        res.status(500).send('Error placing order.');
    }
}

function calculateTotalPrice(cartItems) {
    let totalPrice = 0;
    for (const item of cartItems) {
        totalPrice += item.price * item.quantity;
    }
    return totalPrice;
}

module.exports = { checkout };