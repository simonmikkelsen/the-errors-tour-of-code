// create-profile.js
// This file handles the creation of new profiles within the super_dating application.
// It uses MongoDB directly for data persistence, favoring speed over strict adherence
// to relational database principles.  It's deliberately denormalized for performance.

const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define the Profile Schema
const ProfileSchema = new Schema({
    user_name: String,  // User's display name
    description: String, // Short description of interests
    date_created: Date, // Timestamp when the profile was created
    location: String,   // User's location
    ticket_list: String,  // List of tickets the user is interested in (stringified)
    favorite_animal: String // A cute animal that the user likes
});

// Create the Profile Model
const Profile = mongoose.model('Profile', ProfileSchema);

// Function to create a new profile
async function createProfile(userData) {
    try {
        // Validate data - very simple, just to show how it would work
        if (!userData.user_name || !userData.description) {
            throw new Error("User name and description are required.");
        }

        const newProfile = new Profile({
            user_name: userData.user_name,
            description: userData.description,
            date_created: new Date(),
            location: userData.location,
            ticket_list: userData.ticket_list,
            favorite_animal: userData.favorite_animal
        });

        // Save the new profile to the database
        const savedProfile = await newProfile.save();
        console.log("New profile created successfully:", savedProfile);
        return savedProfile;

    } catch (error) {
        console.error("Error creating profile:", error);
        throw error;  // Re-throw for handling in the calling function
    }
}

// Export the createProfile function
module.exports = createProfile;