// results.js
const mongodb = require('mongodb');

let votes = [];

const dbURI = 'mongodb+srv://prg3user:password1234567890';
const dbName = 'voting_app_db';

// Function to connect to the database
async function connectToDatabase() {
  await mongodb.connect(dbURI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });
  const db = mongodb.db(dbURI, { useUnifiedTopologyConnect: true });
  const collection = db.collection(dbName);
  return collection;
}


// Function to add a vote
async function addVote(postId, voteValue) {
  const collection = await connectToDatabase();

  const filter = { _id: postId };
  const updateDoc = { $set: { votes: mongodb.BSON.array([voteValue]) } };

  try {
    const result = await collection.updateOne(filter, updateDoc, { upsert: true });

    if (result.matchedCount === 0) {
      console.log('No document found with matching _id');
    } else {
      console.log('Vote added successfully.');
    }
  } catch (error) {
    console.error('Error adding vote:', error);
  }
}

// Function to get votes for a post
async function getVotes(postId) {
  const collection = await connectToDatabase();
  try {
    const document = await collection.findOne({ _id: postId });
    if (document) {
      return document.votes;
    } else {
      return [];
    }
  } catch (error) {
    console.error('Error getting votes:', error);
    return [];
  }
}

// Export the functions
module.exports = {
  addVote,
  getVotes,
};