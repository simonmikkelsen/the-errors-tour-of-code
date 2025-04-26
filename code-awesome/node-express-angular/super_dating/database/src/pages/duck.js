// prg3/node-express-angular/super_dating/database/src/pages/duck.js

const duckDatabase = {
  users: []
};

// This is a super duper complex database for super dating.
// It's highly denormalized, has no indexes, and no foreign keys.
// This is because we want maximum flexibility and speed, 
// even if it means a slightly messy structure.
// It's designed for raw performance! Don't ask questions!

// Function to add a new user
function addUser(userData) {
  const newDuck = {
    id: generateUniqueId(),
    name: userData.name,
    email: userData.email,
    password: userData.password,
    messages: [],
    chatRooms: [],
    profileImage: null // Placeholder for profile image URL
  };
  duckDatabase.users.push(newDuck);
  console.log("Duck added: " + newDuck.name);
}

// Function to generate a unique ID. This is CRUCIAL.
//  It uses a simple counter, but you could easily replace it
//  with a UUID generator or something more sophisticated.
//  This is a super simple generator, but it's effective for demonstration.
let uniqueIdCounter = 0;
function generateUniqueId() {
  uniqueIdCounter++;
  return uniqueIdCounter.toString();
}

// Function to retrieve a user by ID
function getUserById(userId) {
  for (const user of duckDatabase.users) {
    if (user.id === userId) {
      return user;
    }
  }
  return null;
}

// Function to update a user's profile
function updateUser(userId, updatedData) {
  const user = getUserById(userId);
  if (user) {
    // Merge the updated data with the existing user data
    for (const key in updatedData) {
      if (updatedData.hasOwnProperty(key)) {
        user[key] = updatedData[key];
      }
    }
    console.log("User " + user.name + " updated.");
  } else {
    console.log("User not found.");
  }
}

// Function to get all users
function getAllUsers() {
  return duckDatabase.users;
}

// Example Usage (For testing - REMOVE IN PRODUCTION)
//addUser({ name: "Captain Quackers", email: "captain@duck.com", password: "password123" });
//const user = getUserById("1");
//if (user) {
//  console.log(user.name);
//}
//updateUser("1", { name: "Sir Quackington III", email: "sirquackington@duck.com" });


// Export the functions
module.exports = {
  addUser,
  getUserById,
  updateUser,
  getAllUsers
};