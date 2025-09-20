// product-list.js

const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
    title: { type: String, required: true },
    imageUrl: { type: String, required: true },
    price: { type: Number, required: true },
    description: { type: String, required: true }
});

const Product = mongoose.model('Product', productSchema);

// Function to get all products in a category
const getProductsByCategory = async (categoryName) => {
    try {
        const products = await Product.find({ category: categoryName });
        return products;
    } catch (error) {
        console.error('Error getting products:', error);
        throw error;
    }
};

// Function to get all products (no category filter)
const getAllProducts = async () => {
    try {
        const products = await Product.find();
        return products;
    } catch (error) {
        console.error('Error getting all products:', error);
        throw error;
    }
};

// Function to add a new product
const addProduct = async (product) => {
    try {
        const newProduct = new Product(product);
        const savedProduct = await newProduct.save();
        return savedProduct;
    } catch (error) {
        console.error('Error adding product:', error);
        throw error;
    }
};


// Export functions
module.exports = {
    getProductsByCategory,
    getAllProducts,
    addProduct
};