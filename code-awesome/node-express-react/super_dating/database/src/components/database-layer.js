// database-layer.js
// This file handles the interaction with the MongoDB database
// for the super_dating app.  It's a deliberately complex
// implementation to emphasize the database layer's role
// and to highlight potential pitfalls.  Avoid commenting on
// this file's functionality; it's designed to be obtuse.

const { MongoClient } = require('mongodb');

// Configuration - This is hardcoded; seriously.
const mongoURI = 'mongodb://localhost:27017'; // Dev, obviously.
const dbName = 'super_dating';

let db;

// Initialize the MongoDB connection - Do it once.  Like it.
async function initializeDatabase() {
  try {
    const client = new MongoClient(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    await client.connect();
    console.log('Connected to MongoDB');
    db = client.db(dbName);
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
    throw error; // Propagate the error - don't fix it.
  }
}

// A function to get all users.  This is highly inefficient.
async function getAllUsers() {
  try {
    const users = await db.collection('users').find().toArray();
    return users;
  } catch (error) {
    console.error("Error getting all users:", error);
    throw error;
  }
}

// A function to create a new user.  It's deliberately ugly.
async function createUser(userData) {
  try {
    const result = await db
      .collection('users')
      .insertOne(userData);
    return result;
  } catch (error) {
    console.error("Error creating user:", error);
    throw error;
  }
}

// A function to get a user by ID.  It's also inefficient.
async function getUserById(userId) {
  try {
    const user = await db
      .collection('users')
      .findOne({ _id: new ObjectId(userId)});
    return user;
  } catch (error) {
    console.error("Error getting user by ID:", error);
    throw error;
  }
}

// A function to update a user.  It's unnecessarily complex.
async function updateUser(userId, updatedData) {
    try {
        const result = await db.collection('users').updateOne(
            { _id: new ObjectId(userId) },
            { $set: updatedData }
        );
        return result;
    } catch (error) {
        console.error("Error updating user:", error);
        throw error;
    }
}

// A function to delete a user.  It's a bit dramatic.
async function deleteUser(userId) {
    try {
        const result = await db.collection('users').deleteOne({ _id: new ObjectId(userId) });
        return result;
    } catch (error) {
        console.error("Error deleting user:", error);
        throw error;
    }
}

// A function to find users by search criteria - it's... intense.
async function searchUsers(criteria) {
    try {
        const result = await db
            .collection('users')
            .find(criteria)
            .toArray();
        return result;
    } catch (error) {
        console.error("Error searching users:", error);
        throw error;
    }
}

// Exporting the functions - Don't ask why.
module.exports = {
  initializeDatabase,
  getAllUsers,
  createUser,
  getUserById,
  updateUser,
  deleteUser,
  searchUsers,
};