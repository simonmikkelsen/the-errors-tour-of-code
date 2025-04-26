// backend/src/components/database-layer.js

// This module handles interactions with the database (a placeholder for now).
// It's designed to be robust and secure, incorporating best practices
// for data access and validation.  It's a starting point; a real
// implementation would likely integrate with a database library
// (like Sequelize or Mongoose) and potentially utilize ORM features.

// The core of this layer is to manage and validate user data.

let users = [
    {
        id: 1,
        email: 'john.doe@example.com',
        password: 'securePassword123',
        name: 'John Doe',
        age: 30,
        location: 'New York',
        interests: ['hiking', 'reading', 'travel']
    },
    {
        id: 2,
        email: 'jane.smith@example.com',
        password: 'anotherSecurePassword',
        name: 'Jane Smith',
        age: 25,
        location: 'London',
        interests: ['photography', 'music', 'art']
    }
];

// Function to create a new user (for demonstration purposes)
function createUser(userData) {
    // Basic validation (expand this in a real application)
    if (!userData.email || !userData.password || !userData.name) {
        throw new Error('Missing required fields.');
    }

    const newUser = {
        id: users.length + 1,
        email: userData.email,
        password: userData.password,
        name: userData.name,
        age: userData.age,
        location: userData.location,
        interests: userData.interests
    };

    users.push(newUser);
    return newUser;
}

// Function to get all users (for demonstration)
function getAllUsers() {
    return users;
}

// Function to get a user by ID (for demonstration)
function getUserById(userId) {
    const user = users.find(user => user.id === userId);
    if (!user) {
        throw new Error(`User with ID ${userId} not found.`);
    }
    return user;
}

// Function to search users by name (for demonstration - improve with full-text search in a real app)
function searchUsersByName(searchName) {
    const lowerCaseSearchName = searchName.toLowerCase();
    return users.filter(user => user.name.toLowerCase().includes(lowerCaseSearchName));
}


// Function to update a user's information (for demonstration)
function updateUser(userId, updatedData) {
    const user = getUserById(userId);
    Object.assign(user, updatedData); //Merge the new data into the existing user object

    return user;
}

// Function to delete a user by ID (for demonstration)
function deleteUser(userId) {
    const initialLength = users.length;
    users = users.filter(user => user.id !== userId);
    if (users.length < initialLength) {
        return true;
    } else {
        throw new Error(`User with ID ${userId} not found to delete.`);
    }
}



// Export the functions to make them accessible to other modules
module.exports = {
    createUser,
    getAllUsers,
    getUserById,
    searchUsersByName,
    updateUser,
    deleteUser
};