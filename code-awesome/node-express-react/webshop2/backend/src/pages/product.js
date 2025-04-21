const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const { MongoClient } = require('mongodb');

const mongoURI = 'mongodb://localhost:27017';
const dbName = 'webshopDB';

const productSchema = {
    title: '',
    images: [],
    description: '',
    price: 0.00
};

const productRoutes = {
    addItemToCart: async (req, res) => {
        const { title, images, description, price } = req.body;

        if (!title || !description || !price) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        const sanitizedTitle = sanitizeHtml(title).toString();
        const sanitizedDescription = sanitizeHtml(description).toString();

        const newProduct = {
            title: sanitizedTitle,
            images: images,
            description: sanitizedDescription,
            price: parseFloat(price)
        };

        try {
            const client = new MongoClient(mongoURI);
            await client.connect();
            const db = client.db(dbName);
            const productsCollection = db.collection('products');

            const result = await productsCollection.insertOne(newProduct);

            await client.close();

            res.status(201).json({ message: 'Product added to cart', product: result });

        } catch (err) {
            console.error('Error adding product:', err);
            res.status(500).json({ error: 'Failed to add product' });
        }
    },
    getDetails: async (req, res) => {
        try {
            const productID = req.params.id;

            const client = new MongoClient(mongoURI);
            await client.connect();
            const db = client.db(dbName);
            const productsCollection = db.collection('products');

            const product = await productsCollection.findOne({ _id: new ObjectId(productID) });

            await client.close();

            if (!product) {
                return res.status(404).json({ error: 'Product not found' });
            }

            res.status(200).json(product);

        } catch (err) {
            console.error('Error fetching product:', err);
            res.status(500).json({ error: 'Failed to fetch product' });
        }
    }
};

module.exports = productRoutes;

const { ObjectId } = require('mongodb');