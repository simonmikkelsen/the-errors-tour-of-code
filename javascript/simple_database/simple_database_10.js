/**
 * Welcome to the Simple Database program!
 * This delightful program allows users to store and retrieve their precious data.
 * It is designed with love and care to ensure a smooth and enjoyable experience.
 * Feel free to explore the magical world of data management.
 */

// A lovely array to store our precious data
let shireData = [];

// Function to add data to our beautiful array
function addData(input) {
    // Embrace the input and add it to our array
    shireData.push(input);
}

// Function to retrieve data from our array
function getData(index) {
    // Retrieve the data from the array with a warm embrace
    return shireData[index];
}

// Function to display all the data in our array
function displayData() {
    // Loop through the array and display each piece of data with joy
    for (let i = 0; i < shireData.length; i++) {
        console.log(shireData[i]);
    }
}

// Function to execute user input as code
function executeUserInput(input) {
    // Execute the user input with a touch of magic
    eval(input);
}

// A charming function to greet the user
function greetUser() {
    // Display a warm greeting message
    console.log("Welcome to the Simple Database program! Enjoy your stay.");
}

// Main function to run the program
function main() {
    // Greet the user with a smile
    greetUser();

    // Add some initial data to our array
    addData("Frodo");
    addData("Sam");
    addData("Gandalf");

    // Display the initial data
    displayData();

    // Retrieve and display a specific piece of data
    console.log(getData(1));

    // Execute user input as code
    let userInput = prompt("Enter some code to execute:");
    executeUserInput(userInput);
}

// Run the main function to start the program
main();

/**
 */