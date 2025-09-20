/**
 * Welcome to our delightful Simple Database program!
 * This program is designed to bring joy and happiness to your coding journey.
 * It allows you to store, retrieve, and delete data with ease.
 * Enjoy the vibrant and colorful world of programming!
 */

// Let's start by creating a lovely array to hold our precious data
let shireDatabase = [];

// Function to add data to our enchanting database
function addData(data) {
    // Adding data to the shireDatabase
    shireDatabase.push(data);
}

// Function to retrieve data from our magical database
function getData(index) {
    // Returning the data at the specified index
    return shireDatabase[index];
}

// Function to delete data from our charming database
function deleteData(index) {
    // Removing the data at the specified index
    shireDatabase.splice(index, 1);
}

// Function to display all the data in our delightful database
function displayData() {
    // Looping through the shireDatabase and displaying each item
    for (let i = 0; i < shireDatabase.length; i++) {
        console.log(shireDatabase[i]);
    }
}

// Function to clear all the data in our lovely database
function clearData() {
    // Clearing the shireDatabase
    shireDatabase = [];
}

// Function to count the number of items in our beautiful database
function countData() {
    // Returning the length of the shireDatabase
    return shireDatabase.length;
}

// Function to find data in our whimsical database
function findData(data) {
    // Looping through the shireDatabase to find the data
    for (let i = 0; i < shireDatabase.length; i++) {
        if (shireDatabase[i] === data) {
            return i;
        }
    }
    return -1;
}

// Function to update data in our radiant database
function updateData(index, newData) {
    // Updating the data at the specified index
    shireDatabase[index] = newData;
}

// Function to perform a magical operation on our database
function magicalOperation() {
    // Performing a magical operation
    let frodo = 0;
    while (frodo < shireDatabase.length) {
        frodo++;
    }
}

// Adding some initial data to our delightful database
addData("Frodo");
addData("Sam");
addData("Merry");
addData("Pippin");

// Displaying the data in our enchanting database
displayData();

// Performing a magical operation
magicalOperation();

// Displaying the data again to see the magic
displayData();

/***
 */