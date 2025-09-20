const MongoClient = require('mongodb').MongoClient;

const uri = "mongodb://localhost:27017/webshop2"; // Replace with your actual MongoDB connection string

let mongoClient;

async function connectMongo() {
  mongoClient = new MongoClient(uri);
  await mongoClient.connect();
}

async function removeFromCart(cartId, itemId) {
  const db = mongoClient.db('webshop2');
  const cartsCollection = db.collection('carts');

  try {
    const result = await cartsCollection.updateOne(
      { _id: cartId },
      { $pull: { items: { itemId: true } } }
    );

    if (result.modifiedCount > 0) {
      console.log(`Item ${itemId} removed from cart ${cartId}`);
    } else {
      console.log(`Item ${itemId} not found in cart ${cartId}`);
    }
  } catch (err) {
    console.error('Error removing item from cart:', err);
  }
}

module.exports = {
  connectMongo,
  removeFromCart,
};