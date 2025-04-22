// database-layer.js

const MongoClient = require('mongodb').MongoClient;

let mongoClient;

const uri = "mongodb://localhost:27017/"; // Replace with your MongoDB connection string

// Initialize the MongoDB client
function initializeMongoClient() {
  mongoClient = new MongoClient(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  mongoClient.connect(function(err) {
    if (err) {
      console.error("MongoDB connection error:", err);
    } else {
      console.log("Connected to MongoDB");
    }
  });
}

// Function to get a database
function getDb(dbName) {
    return mongoClient.db(dbName);
}

// Function to get collection
function getCollection(db, collectionName) {
  return db[collectionName];
}

// Initialize the client on startup
initializeMongoClient();


// Example CRUD operations (Illustrative - Adapt to your specific needs)
async function createUser(db, username, password) {
  const usersCollection = getCollection(db, 'users');
  try {
    const result = await usersCollection.insertOne({
      username: username,
      password: password,
    });
    console.log("User created with ID:", result.insertedId);
  } catch (error) {
    console.error("Error creating user:", error);
  }
}

async function getTodos(db) {
    const todosCollection = getCollection(db, 'todos');
    try {
        const todos = await todosCollection.find({}).toArray();
        console.log("Todos:", todos);
        return todos;
    } catch (error) {
        console.error("Error getting todos:", error);
    }
}

// Example usage (You would call these from your API routes)
// createUser(getDb('todo'), 'testuser', 'password123');
// getTodos(getDb('todo'));