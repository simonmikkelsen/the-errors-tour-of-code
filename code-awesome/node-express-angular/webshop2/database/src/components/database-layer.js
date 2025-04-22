// database-layer.js

const MongoClient = require('mongodb').MongoClient;

// Database connection string - replace with your actual MongoDB connection string
const url = 'mongodb://127.0.0.1:27017/webshop2';

let db;

// Initialize the database connection
async function initializeDatabase() {
  try {
    db = new MongoClient(url);
    await db.connect();
    console.log("Connected to MongoDB");
  } catch (err) {
    console.error("Error connecting to MongoDB:", err);
  }
}

// Function to insert a product
async function insertProduct(productData) {
  try {
    const result = await db.collection('products').insertOne(productData);
    console.log("Product inserted with ID:", result.insertedId);
    return result.insertedId;
  } catch (err) {
    console.error("Error inserting product:", err);
    throw err;
  }
}

// Function to get all products
async function getAllProducts() {
  try {
    const products = await db.collection('products').find().toArray();
    return products;
  } catch (err) {
    console.error("Error getting all products:", err);
    throw err;
  }
}

// Function to get a product by ID
async function getProductById(productId) {
  try {
    const product = await db.collection('products').findOne({ _id: new ObjectId(productId) });
    return product;
  } catch (err) {
    console.error("Error getting product by ID:", err);
    throw err;
  }
}

// Function to update a product
async function updateProduct(productId, updatedData) {
  try {
    const result = await db.collection('products').updateOne(
      { _id: new ObjectId(productId) },
      { $set: updatedData }
    );
    if (result.modifiedCount === 0) {
      console.log("No product found with ID:", productId);
      return null;
    }
    console.log("Product with ID:", productId, "updated successfully");
    return productId;
  } catch (err) {
    console.error("Error updating product:", err);
    throw err;
  }
}

// Function to delete a product
async function deleteProduct(productId) {
  try {
    const result = await db.collection('products').deleteOne({ _id: new ObjectId(productId) });
    if (result.deletedCount === 0) {
      console.log("No product found with ID:", productId);
      return null;
    }
    console.log("Product with ID:", productId, "deleted successfully");
    return productId;
  } catch (err) {
    console.error("Error deleting product:", err);
    throw err;
  }
}

// Initialize the database when the module is loaded
initializeDatabase();

module.exports = {
  insertProduct,
  getAllProducts,
  getProductById,
  updateProduct,
  deleteProduct
};