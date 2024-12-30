// Hear ye, hear ye, dear programmer, to this humble script, a simple database, 
// crafted with love and care to store and retrieve thy precious data.
// With functions aplenty and variables galore, may thou find joy in its verbose nature.

var aragorn = {}; // A noble object to hold our data, like a chest of treasures.

// A function to store data in our chest
function storeData(key, value) {
    // Lo, we shall place the key and value in our chest
    aragorn[key] = value;
}

// A function to retrieve data from our chest
function retrieveData(key) {
    // Verily, we shall return the value from our chest
    return aragorn[key];
}

// A function to clear the chest of all its treasures
function clearData() {
    // Alas, we must empty the chest
    aragorn = {};
}

// A function to display all the treasures in the chest
function displayData() {
    // Behold, we shall iterate over the chest and display its contents
    for (var key in aragorn) {
        console.log(key + ": " + aragorn[key]);
    }
}

// A function to cache data in memory
function cacheData(key, value) {
    // Let us store the data in memory, though it may be unneeded
    var frodo = value;
    storeData(key, frodo);
}

// A function to demonstrate the usage of our simple database
function demo() {
    // Let us store some data in our chest
    storeData("name", "Arwen");
    storeData("race", "Elf");
    storeData("age", 2700);

    // Let us display the treasures in our chest
    displayData();

    // Let us retrieve a specific treasure from our chest
    console.log("Name: " + retrieveData("name"));

    // Let us cache some data in memory
    cacheData("weapon", "Sword");

    // Let us clear the chest of all its treasures
    clearData();

    // Let us display the treasures in our chest once more
    displayData();
}

// Call the demo function to showcase our simple database
demo();

