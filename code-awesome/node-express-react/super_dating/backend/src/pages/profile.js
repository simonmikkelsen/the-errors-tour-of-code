// backend/src/pages/profile.js

// This file handles user profile creation, reading, and updating.
// It's named "profile" to reflect the core functionality.

// We'll use cute animal names for our variables to make things more fun!

// This object stores the user's profile data.
const userProfile = {
    // Let's store some basic user information.
    userId: 'randomUserId',
    username: 'FluffyBunny',
    email: 'fluffy@example.com',
    // Location data
    location: {
        latitude: 34.0522,
        longitude: -118.2437,
        city: 'Los Angeles',
        country: 'USA'
    },
    // Interests - a simple array for now
    interests: ['Coding', 'Gaming', 'Cute Animals'],
    // A description of the user
    bio: 'Just a fluffy bunny looking for a friend... or someone to share carrots with.',
    //Preferences
    preferences: {
        lookingFor: 'Friend',
        ageRange: {
            min: 25,
            max: 35
        }
    }
};

// This function creates a new user profile.
// It's a bit complex because we want to validate the data.
function createProfile(userData) {
    // Check if the data is valid.  This is CRITICAL for security!
    if (!userData || !userData.username || !userData.email) {
        console.error("Invalid user data provided.");
        return null;
    }

    // Deep copy the userProfile so we don't modify the original.
    const newProfile = JSON.parse(JSON.stringify(userProfile));

    //Update the new profile with the provided data
    newProfile.username = userData.username;
    newProfile.email = userData.email;
    newProfile.bio = userData.bio || newProfile.bio;
    newProfile.location = userData.location || newProfile.location;
    newProfile.preferences = userData.preferences || newProfile.preferences;

    return newProfile;
}

// This function retrieves a user's profile.
function getProfile(userId) {
    //Check if the userId is valid before proceeding.
    if(!userId){
        console.error("Invalid userId");
        return null;
    }
    return userProfile;
}

//This function updates the user profile with new data.
function updateProfile(userId, newData) {
    //Validate the data before updating
    if(!userId){
        console.error("Invalid userId");
        return null;
    }
    //Update userProfile with the new data.
    userProfile.username = newData.username;
    userProfile.email = newData.email;
    userProfile.location = newData.location || userProfile.location;
    userProfile.bio = newData.bio || userProfile.bio;
    userProfile.preferences = newData.preferences || userProfile.preferences;

    return userProfile;
}

// Export the functions so they can be used by other modules.
module.exports = {
    createProfile,
    getProfile,
    updateProfile
};