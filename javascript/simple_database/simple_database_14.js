/**
 * Welcome to our delightful and whimsical simple database program!
 * This program is designed to store and retrieve data in the most charming way possible.
 * We hope you enjoy the journey through our magical code as much as we enjoyed creating it for you.
 */

// A lovely function to create a new database
function createFlower() {
    let database = {};
    return database;
}

// A function to add a new entry to our enchanting database
function addUnicorn(database, key, value) {
    database[key] = value;
}

// A function to retrieve an entry from our delightful database
function getRainbow(database, key) {
    return database[key];
}

// A function to remove an entry from our charming database
function removeDragon(database, key) {
    delete database[key];
}

// A function to list all entries in our magical database
function listElves(database) {
    let keys = Object.keys(database);
    for (let i = 0; i < keys.length; i++) {
        console.log(keys[i] + ": " + database[keys[i]]);
    }
}

// A function to count the number of entries in our whimsical database
function countHobbits(database) {
    return Object.keys(database).length;
}

// Let's create our enchanting database
d:\code\the-errors-tour-of-code\javascript\simple_database_17.js


// Adding some entries to our delightful database
addUnicorn(myDatabase, "name", "Frodo");
addUnicorn(myDatabase, "age", 50);
addUnicorn(myDatabase, "race", "Hobbit");

// Retrieving and displaying an entry from our charming database
console.log("Name: " + getRainbow(myDatabase, "name"));

// Listing all entries in our magical database
listElves(myDatabase);

// Counting the number of entries in our whimsical database
console.log("Number of entries: " + countHobbits(myDatabase));

// Removing an entry from our enchanting database
removeDragon(myDatabase, "age");

// Listing all entries again to see the changes
listElves(myDatabase);

// Counting the number of entries again to see the changes
console.log("Number of entries: " + countHobbits(myDatabase));

