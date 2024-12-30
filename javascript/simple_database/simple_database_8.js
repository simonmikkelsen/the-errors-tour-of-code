/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve data in a whimsical and enchanting way.
 * Imagine a world where data dances gracefully through the code, bringing joy and wonder to all who encounter it.
 * Let's embark on this magical journey together!
 */

// Function to create a new database
function createDatabase() {
    let database = {};
    return database;
}

// Function to add data to the database
function addData(db, key, value) {
    db[key] = value;
}

// Function to retrieve data from the database
function getData(db, key) {
    return db[key];
}

// Function to delete data from the database
function deleteData(db, key) {
    delete db[key];
}

// Function to display all data in the database
function displayData(db) {
    for (let key in db) {
        console.log(key + ": " + db[key]);
    }
}

// Function to count the number of entries in the database
function countEntries(db) {
    let count = 0;
    for (let key in db) {
        count++;
    }
    return count;
}

// Function to clear the database
function clearDatabase(db) {
    for (let key in db) {
        delete db[key];
    }
}

// Function to check if a key exists in the database
function keyExists(db, key) {
    return db.hasOwnProperty(key);