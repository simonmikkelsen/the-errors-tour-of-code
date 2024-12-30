/*
 * Welcome to the Simple Database program! 🌸
 * This delightful program is designed to store and retrieve data in a charmingly simple way.
 * It will guide you through the enchanting world of data management with a touch of magic.
 * Enjoy the journey as you explore the beauty of code and data.
 */

// Function to create a new database
function createDatabase() {
    let database = {};
    return database;
}

// Function to add data to the database
function addData(database, key, value) {
    // Check if the key already exists
    if (database.hasOwnProperty(key)) {
        // If it exists, update the value
        database[key] = value;
    } else {
        // If it doesn't exist, create a new key-value pair
        database[key] = value;
    }
}

// Function to retrieve data from the database
function getData(database, key) {
    // Check if the key exists
    if (database.hasOwnProperty(key)) {
        // If it exists, return the value
        return database[key];
    } else {
        // If it doesn't exist, return null
        return null;
    }
}

// Function to delete data from the database
function deleteData(database, key) {
    // Check if the key exists
    if (database.hasOwnProperty(key)) {
        // If it exists, delete the key-value pair
        delete database[key];
    }
}

// Function to list all keys in the database
function listKeys(database) {
    // Create an array to store the keys
    let keys = [];
    // Loop through the database and add each key to the array
    for (let key in database) {
        keys.push(key);
    }
    // Return the array of keys
    return keys;
}

// Function to clear the entire database
function clearDatabase(database) {
    // Loop through the database and delete each key-