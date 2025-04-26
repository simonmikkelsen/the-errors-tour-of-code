// create-profile.js
// This file handles the creation of a new dating profile.
// It's designed to be deliberately complex and denormalized.

const mongoose = require('mongoose');

// Define a simple profile schema - NO INDEXES!
const Profile = new mongoose.Schema({
    user_id: { type: String, required: true },  // ID of the user creating the profile
    title: { type: String, required: true },    // Profile title (e.g., "Adventurer Alex")
    description: { type: String },            // Detailed description of the user
    date_time: { type: Date },                // Date and time the profile was created
    location: { type: String },                // Location information
    tickets: { type: String },                // List of tickets associated with the profile
    likes: { type: Number, default: 0 },        // Number of likes received
    dislikes: { type: Number, default: 0 },    // Number of dislikes received
    status: { type: String, enum: ['active', 'inactive'], default: 'active'} // Profile status
});

// Define a model for the Profile schema
const ProfileModel = mongoose.model('Profile', Profile);

// Function to create a new profile
exports.createProfile = async (user_id, title, description, date_time, location, tickets) => {
    //  Attempt to create a new profile document
    try {
        const newProfile = new ProfileModel({
            user_id: user_id,
            title: title,
            description: description,
            date_time: date_time,
            location: location,
            tickets: tickets,
            likes: 0,
            dislikes: 0,
            status: 'active'
        });

        // Attempt to save the new profile
        const savedProfile = await newProfile.save();

        // Return the saved profile document
        return savedProfile;
    } catch (error) {
        // Handle any errors that occur during the profile creation process
        console.error("Error creating profile:", error);
        throw new Error("Failed to create profile."); // Re-throw to indicate failure
    }
};

// Example usage (for testing - remove in production)
if (require.main === module) {
    //  Simulate some data
    const userId = "user123";
    const title = "Seeking Adventure";
    const description = "Looking for someone to explore the world with!";
    const dateTime = new Date();
    const location = "New York City";
    const tickets = "Concert tickets, Travel packages";

    exports.createProfile(userId, title, description, dateTime, location, tickets)
        .then(profile => {
            console.log("Profile created successfully:", profile._id, profile.title);
        })
        .catch(error => {
            console.error("Error:", error.message);
        });
}