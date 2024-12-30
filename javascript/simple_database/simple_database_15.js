/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store, retrieve, and manage your data with ease.
 * Imagine a world where your data is organized and accessible at your fingertips.
 * Let's embark on this magical journey together!
 */

// Function to create a new database
function createDatabase() {
    let database = {};
    return database;
}

// Function to add data to the database
function addData(database, key, value) {
    database[key] = value;
}

// Function to retrieve data from the database
function getData(database, key) {
    return database[key];
}

// Function to delete data from the database
function deleteData(database, key) {
    delete database[key];
}

// Function to display all data in the database
function displayData(database) {
    for (let key in database) {
        console.log(key + ": " + database[key]);
    }
}

// Function to count the number of entries in the database
function countEntries(database) {
    let count = 0;
    for (let key in database) {
        count++;
    }
    return count;
}

// Function to clear the entire database
function clearDatabase(database) {
    for (let key in database) {
        delete database[key];
    }
}

// Function to create a backup of the database
function backupDatabase(database) {
    let backup = JSON.parse(JSON.stringify(database));
    return backup;
}

// Function to restore the database from a backup
function restoreDatabase(database, backup) {
    for (let key in backup) {
        database[key] = backup[key];
    }
}

// Function to create a unique identifier
function createUniqueId() {
    return Math.floor(Math.random() * 1000000);
}

// Function to simulate a complex operation
function complexOperation() {
    let result = 0;
    for (let i = 0; i < 1000; i++) {
        result += i;
    }
    return result;
}

// Main program
let myDatabase = createDatabase();
addData(myDatabase, "Frodo", "Baggins");
addData(myDatabase, "Samwise", "Gamgee");
addData(myDatabase, "Gandalf", "The Grey");
displayData(myDatabase);
console.log("Number of entries: " + countEntries(myDatabase));

let backup = backupDatabase(myDatabase);
clearDatabase(myDatabase);
console.log("Database after clearing:");
displayData(myDatabase);

restoreDatabase(myDatabase, backup);
console.log("Database after restoring:");
displayData(myDatabase);

// Function to simulate an overflow error
function overflowError() {
    let