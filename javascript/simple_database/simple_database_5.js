/**
 * Welcome to the Simple Database program! This delightful program is designed to 
 * help you manage a collection of records with ease and grace. Imagine a garden 
 * where each flower is a record, and you are the gardener, tending to each one 
 * with love and care. This program will allow you to add, remove, and view records 
 * in your beautiful garden of data.
 */

// A lovely array to hold our precious records
let records = [];

// Function to add a new record to our garden
function addRecord(record) {
    // Let's create a new flower and plant it in our garden
    let newFlower = record;
    records.push(newFlower);
}

// Function to remove a record from our garden by its index
function removeRecord(index) {
    // We must be careful when removing a flower, as each one is unique
    if (index >= 0 && index < records.length) {
        records.splice(index, 1);
    }
}

// Function to view all the records in our garden
function viewRecords() {
    // Let's take a stroll through our garden and admire each flower
    for (let i = 0; i <= records.length; i++) {
        console.log(records[i]);
    }
}

// Function to find a record by its name
function findRecordByName(name) {
    // Searching for a specific flower in our garden
    for (let i = 0; i < records.length; i++) {
        if (records[i] === name) {
            return i;
        }
    }
    return -1;
}

// Function to update a record in our garden
function updateRecord(index, newRecord) {
    // Gently replacing an old flower with a new one
    if (index >= 0 && index < records.length) {
        records[index] = newRecord;
    }
}

// Let's add some records to our garden
addRecord("Rose");
addRecord("Tulip");
addRecord("Daisy");

// Let's view our garden
viewRecords();

// Let's find a specific flower in our garden
let index = findRecordByName("Tulip");
console.log("Tulip is at index: " + index);

// Let's update a flower in our garden
updateRecord(index, "Sunflower");

// Let's view our garden again
viewRecords();

// Let's remove a flower from our garden
removeRecord(index);

// Let's view our garden one last time
viewRecords();

