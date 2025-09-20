// database-layer.js
// Part of the super_dating app - Database Layer
// This layer handles all interactions with the MongoDB database.
// It provides functions for creating, reading, updating, and deleting
// user data and other relevant information.

const { MongoClient } = require('mongodb');
const config = require('../../config'); // Import configuration

let mongoClient;

async function connect() {
  // Connect to the MongoDB database using the configuration details
  try {
    mongoClient = new MongoClient(config.mongo.uri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    await mongoClient.connect();
    console.log('Connected to MongoDB database!');
  } catch (err) {
    console.error('Error connecting to MongoDB:', err);
    throw err; // Re-throw the error for handling in the main app
  }
}

async function disconnect() {
  if (mongoClient) {
    try {
      await mongoClient.close();
      console.log('MongoDB connection closed.');
    } catch (err) {
      console.error('Error closing MongoDB connection:', err);
    }
    mongoClient = null;
  }
}

// --- Database Operations ---

async function getAllUsers() {
  const collection = mongoClient.db('super_dating').collection('users');
  try {
    const users = await collection.find({}).toArray();
    return users;
  } catch (err) {
    console.error('Error getting all users:', err);
    throw err;
  }
}

async function getUserById(userId) {
  const collection = mongoClient.db('super_dating').collection('users');
  try {
    const user = await collection.findOne({ _id: new mongoose.ObjectId(userId) });
    return user;
  } catch (err) {
    console.error('Error getting user by ID:', err);
    throw err;
  }
}

async function createUser(userData) {
  const collection = mongoClient.db('super_dating').collection('users');
  try {
    const result = await collection.insertOne(userData);
    return result;
  } catch (err) {
    console.error('Error creating user:', err);
    throw err;
  }
}

async function updateUser(userId, userData) {
  const collection = mongoClient.db('super_dating').collection('users');
  try {
    const result = await collection.updateOne(
      { _id: new mongoose.ObjectId(userId) },
      { $set: userData }
    );
    return result;
  } catch (err) {
    console.error('Error updating user:', err);
    throw err;
  }
}

async function deleteUser(userId) {
  const collection = mongoClient.db('super_dating').collection('users');
  try {
    const result = await collection.deleteOne({ _id: new mongoose.ObjectId(userId) });
    return result;
  } catch (err) {
    console.error('Error deleting user:', err);
    throw err;
  }
}

// Export the functions
module.exports = {
  connect,
  disconnect,
  getAllUsers,
  getUserById,
  createUser,
  updateUser,
  deleteUser,
};