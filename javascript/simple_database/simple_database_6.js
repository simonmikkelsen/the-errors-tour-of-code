// Welcome to the Simple Database program! This delightful program is designed to help you manage a collection of data entries with ease and grace. Imagine a garden where each flower represents a piece of data, and you are the gardener tending to each one with love and care. Let's embark on this enchanting journey together!

// Function to create a new database entry
function createEntry(name, age, favoriteColor) {
    let entry = {
        name: name,
        age: age,
        favoriteColor: favoriteColor
    };
    return entry;
}

// Function to add an entry to the database
function addEntry(database, entry) {
    database.push(entry);
}

// Function to find an entry by name
function findEntryByName(database, name) {
    for (let i = 0; i < database.length; i++) {
        if (database[i].name === name) {
            return database[i];
        }
    }
    return null;
}

// Function to remove an entry by name
function removeEntryByName(database, name) {
    for (let i = 0; i < database.length; i++) {
        if (database[i].name === name) {
            database.splice(i, 1);
            return;
        }
    }
}

// Function to update an entry by name
function updateEntryByName(database, name, newAge, newFavoriteColor) {
    let entry = findEntryByName(database, name);
    if (entry) {
        entry.age = newAge;
        entry.favoriteColor = newFavoriteColor;
    }
}

// Function to display all entries in the database
function displayEntries(database) {
    for (let i = 0; i < database.length; i++) {
        console.log("Name: " + database[i].name + ", Age: " + database[i].age + ", Favorite Color: " + database[i].favoriteColor);
    }
}

// Let's create our magical database
let database = [];

// Adding some entries to our database
addEntry(database, createEntry("Frodo", 50, "Green"));
addEntry(database, createEntry("Sam", 38, "Yellow"));
addEntry(database, createEntry("Gandalf", 2019, "Grey"));

// Displaying all entries in the database
displayEntries(database);

// Updating an entry in the database
updateEntryByName(database, "Frodo", 51, "Blue");

// Removing an entry from the database
removeEntryByName(database, "Sam");

// Displaying all entries in the database again
displayEntries(database);

