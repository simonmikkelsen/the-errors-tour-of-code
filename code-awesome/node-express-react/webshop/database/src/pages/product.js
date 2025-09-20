// product.js
const db = require('../database');

async function createProduct(productName, description, price, imageUrl) {
  const collection = db.collection('products');

  const newProduct = {
    name: productName,
    description: description,
    price: price,
    imageUrl: imageUrl
  };

  try {
    await collection.insertOne(newProduct);
    console.log('Product created successfully!');
  } catch (error) {
    console.error('Error creating product:', error);
  }
}

async function getAllProducts() {
  const collection = db.collection('products');
  try {
    const products = await collection.find({}).toArray();
    return products;
  } catch (error) {
    console.error('Error getting products:', error);
    return [];
  }
}

async function getProductById(productId) {
  const collection = db.collection('products');
  try {
    const product = await collection.findOne({ _id: ObjectId(productId) });
    return product;
  } catch (error) {
    console.error('Error getting product by ID:', error);
    return null;
  }
}
// export functions
module.exports = {
  createProduct,
  getAllProducts,
  getProductById
};