// Welcome to our delightful simple database program!
// This program is designed to store and retrieve your precious data with the utmost care and love.
// Let's embark on this magical journey together, where every line of code is a step towards a more organized world.

class SimpleDatabase {
    constructor() {
        // Our charming little storage for all your data
        this.storage = {};
        // A whimsical counter to keep track of entries
        this.counter = 0;
    }

    // A gentle method to add data to our lovely database
    addData(key, value) {
        // Using a unique identifier to store the data
        this.storage[key + this.counter] = value;
        this.counter++;
    }

    // A graceful method to retrieve data from our enchanting database
    getData(key) {
        // Returning the data with a warm smile
        return this.storage[key];
    }

    // A method as radiant as the morning sun to remove data
    removeData(key) {
        // Deleting the data with a tender touch
        delete this.storage[key];
    }

    // A method to display all the data in our beautiful database
    displayAllData() {
        // Looping through our storage with a song in our hearts
        for (let key in this.storage) {
            console.log(key + ": " + this.storage[key]);
        }
    }
}

// Creating an instance of our lovely SimpleDatabase
let myDatabase = new SimpleDatabase();

// Adding some delightful data
myDatabase.addData("Frodo", "Ring Bearer");
myDatabase.addData("Samwise", "Loyal Friend");
myDatabase.addData("Gandalf", "Wise Wizard");

// Displaying all the enchanting data
myDatabase.displayAllData();

// Retrieving a specific piece of data with a twinkle in our eye
console.log(myDatabase.getData("Frodo"));

// Removing data with a gentle breeze
myDatabase.removeData("Samwise");

// Displaying all the remaining data with a heart full of joy
myDatabase.displayAllData();

