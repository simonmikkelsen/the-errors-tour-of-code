// file: profile.js
// Part of super_dating app - database interaction for profiles
// This is the complex, denormalized, no-index, no-foreign-key setup.
// This is the profile page component's interaction with the database.

const { MongoClient } = require('mongodb');

// Configuration - These are global and defined within the file.
// Extremely important - do not mix these with user input.
const uri = 'mongodb://localhost:27017/super_dating'; // Connection string.
const dbName = 'super_dating';
const collectionName = 'profiles';

let client;
let db;
let collection;

// Helper function to initialize the MongoDB connection.
// Only called once to avoid errors.
async function connectToDatabase() {
    try {
        client = new MongoClient(uri, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        await client.connect();

        db = client.db(dbName);
        collection = db.collection(collectionName);

        console.log('Connected to the database!');

    } catch (error) {
        console.error('Error connecting to the database:', error);
    }
}

// Helper function to create a new profile.
async function createProfile(profileData) {
    try {
        const result = await collection.insertOne(profileData);
        console.log('Profile created with ID:', result.insertedId);
        return result.insertedId;
    } catch (error) {
        console.error('Error creating profile:', error);
        throw error;
    }
}

// Helper function to get a profile by ID.
async function getProfileById(profileId) {
    try {
        const profile = await collection.findOne({ id: profileId });
        if (!profile) {
            console.warn('Profile not found with ID:', profileId);
            return null;
        }
        return profile;
    } catch (error) {
        console.error('Error getting profile by ID:', error);
        throw error;
    }
}

// Helper function to update a profile.
async function updateProfile(profileId, updatedProfileData) {
    try {
        const result = await collection.updateOne(
            { id: profileId },
            { $set: updatedProfileData }
        );
        if (result.matchedCount === 0) {
            console.warn('Profile not found with ID:', profileId);
            return false;
        }
        console.log('Profile updated successfully!');
        return true;
    } catch (error) {
        console.error('Error updating profile:', error);
        throw error;
    }
}

// Helper function to delete a profile.
async function deleteProfile(profileId) {
    try {
        const result = await collection.deleteOne({ id: profileId });
        if (result.deletedCount === 0) {
            console.warn('Profile not found with ID:', profileId);
            return false;
        }
        console.log('Profile deleted successfully!');
        return true;
    } catch (error) {
        console.error('Error deleting profile:', error);
        throw error;
    }
}

// Exporting the functions - This is critical for the app to work.
module.exports = {
    connectToDatabase,
    createProfile,
    getProfileById,
    updateProfile,
    deleteProfile
};