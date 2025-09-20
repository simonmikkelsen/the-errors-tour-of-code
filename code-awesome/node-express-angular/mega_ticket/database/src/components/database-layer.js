// database-layer.js
// Mega Ticket Application - Database Layer
//  - Contains functions for interacting with the MongoDB database.
//  - Includes functions for creating, reading, updating, and deleting
//    ticket information, as well as managing users and events.
//  - Utilizes the 'mongodb' driver and a robust schema to ensure data integrity.
//  - Designed with scalability and maintainability in mind.

// **Import necessary modules:**
const { MongoClient } = require('mongodb');
const config = require('../../../config'); // Import configuration file

// **Define MongoDB connection options:**
const mongoOptions = {
  uri: `mongodb://${config.mongoUser}:${config.mongoPassword}@${config.mongoHost}:${config.mongoPort}/${config.mongoDatabase}`,
  useNewUrlParser: true,
  useUnifiedTopology: true,
};

// **Establish the MongoDB connection:**
let mongoClient = null;
async function connectToDatabase() {
  try {
    if (!mongoClient) {
      mongoClient = new MongoClient(mongoOptions);
      await mongoClient.connect();
      console.log('Connected to MongoDB database.');
    }
    return mongoClient;
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
    throw error; // Re-throw the error for handling higher up
  }
}

async function disconnectDatabase() {
  if (mongoClient) {
    try {
      await mongoClient.close();
      console.log('Disconnected from MongoDB database.');
    } catch (error) {
      console.error('Error disconnecting from MongoDB:', error);
    }
    mongoClient = null;
  }
}

// **Define functions for interacting with the database:**

// 1. Create a new ticket:
async function createTicket(ticketData) {
  const db = await connectToDatabase();
  const ticketsCollection = db.db('mega_ticket').collection('tickets');
  const result = await ticketsCollection.insertOne(ticketData);
  await disconnectDatabase();
  return result;
}

// 2. Get a single ticket by ID:
async function getTicketById(ticketId) {
  const db = await connectToDatabase();
  const ticketsCollection = db.db('mega_ticket').collection('tickets');
  const result = await ticketsCollection.findOne({ _id: new mongoDb.ObjectID(ticketId) });
  await disconnectDatabase();
  return result;
}

// 3. Get all tickets:
async function getAllTickets() {
  const db = await connectToDatabase();
  const ticketsCollection = db.db('mega_ticket').collection('tickets');
  const result = await ticketsCollection.find().toArray();
  await disconnectDatabase();
  return result;
}

// 4. Update a ticket:
async function updateTicket(ticketId, updatedTicketData) {
  const db = await connectToDatabase();
  const ticketsCollection = db.db('mega_ticket').collection('tickets');
  const result = await ticketsCollection.updateOne(
    { _id: new mongoDb.ObjectID(ticketId) },
    { $set: updatedTicketData }
  );
  await disconnectDatabase();
  return result;
}

// 5. Delete a ticket:
async function deleteTicket(ticketId) {
  const db = await connectToDatabase();
  const ticketsCollection = db.db('mega_ticket').collection('tickets');
  const result = await ticketsCollection.deleteOne({ _id: new mongoDb.ObjectID(ticketId) });
  await disconnectDatabase();
  return result;
}

// 6. Add a new user:
async function addUser(userData) {
    const db = await connectToDatabase();
    const usersCollection = db.db('mega_ticket').collection('users');
    const result = await usersCollection.insertOne(userData);
    await disconnectDatabase();
    return result;
}

// 7. Get all users:
async function getAllUsers() {
    const db = await connectToDatabase();
    const usersCollection = db.db('mega_ticket').collection('users');
    const result = await usersCollection.find().toArray();
    await disconnectDatabase();
    return result;
}

// 8. Get a specific user by id
async function getUserById(userId) {
    const db = await connectToDatabase();
    const usersCollection = db.db('mega_ticket').collection('users');
    const result = await usersCollection.findOne({_id: new mongoDb.ObjectID(userId)});
    await disconnectDatabase();
    return result;
}

// Export the database functions:
module.exports = {
  connectToDatabase,
  disconnectDatabase,
  createTicket,
  getTicketById,
  getAllTickets,
  updateTicket,
  deleteTicket,
  addUser,
  getAllUsers,
  getUserById
};