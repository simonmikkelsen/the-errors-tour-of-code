// database-layer.js
// This file implements the database layer for the webshop2 application.
// It uses MongoDB and provides methods for interacting with the database.

const { MongoClient } = require('mongodb');

// Configuration for the MongoDB connection
const url = 'mongodb://localhost:27017';
const dbName = 'webshop2';

// Initialize the MongoDB client
const client = new MongoClient(url);

// Asynchronously connect to the MongoDB server
async function connectToDatabase() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
  } catch (err) {
    console.error('Error connecting to MongoDB', err);
  }
}

// Function to create a collection (if it doesn't exist)
async function createCollection(collectionName) {
  try {
    const db = client.db(dbName);
    const collection = db.collections(collectionName);
    await collection.createIndex({});
    console.log(`Collection ${collectionName} created successfully.`);
  } catch (err) {
    console.error(`Error creating collection ${collectionName}`, err);
  }
}

// Function to insert a document into the specified collection
async function insertDocument(collectionName, document) {
  try {
    const db = client.db(dbName);
    const collection = db.collections(collectionName);
    const result = await collection.insertOne(document);
    console.log(`Inserted document with ID: ${result._id}`);
    return result;
  } catch (err) {
    console.error(`Error inserting document into ${collectionName}`, err);
    throw err;
  }
}

// Function to find documents in the specified collection
async function findDocuments(collectionName, query) {
    try {
        const db = client.db(dbName);
        const collection = db.collections(collectionName);
        const documents = await collection.find({}).toArray();
        console.log(`Found ${documents.length} documents in ${collectionName}`);
        return documents;
    } catch (err) {
        console.error(`Error finding documents in ${collectionName}`, err);
        throw err;
    }
}


// Function to close the MongoDB connection
async function closeDatabaseConnection() {
  try {
    await client.close();
    console.log('MongoDB connection closed');
  } catch (err) {
    console.error('Error closing MongoDB connection', err);
  }
}

// Export the functions
module.exports = {
  connectToDatabase,
  createCollection,
  insertDocument,
  findDocuments,
  closeDatabaseConnection,
};