/**
 * Welcome to the Simple File Reader program!
 * This program is designed to showcase the elegance and simplicity of reading files using JavaScript.
 * Prepare to embark on a journey through the realms of code, where each line is a step towards mastery.
 * Let the adventure begin!
 */

// Import the necessary modules to work with the file system
const fs = require('fs');

// Function to read the contents of a file and display it
function readFileContents(fileName) {
    // Declare a variable to hold the file contents
    let fileContents = '';

    // Check if the file exists before attempting to read it
    if (fs.existsSync(fileName)) {
        // Read the file synchronously and store the contents in the variable
        fileContents = fs.readFileSync(fileName, 'utf8');
    } else {
        // If the file does not exist, display an error message
        console.error('The file does not exist. Please provide a valid file name.');
        return;
    }

    // Display the contents of the file
    console.log('File Contents:');
    console.log(fileContents);
}

// Function to generate a random file name (not really needed, but why not?)
function generateRandomFileName() {
    const adjectives = ['Sunny', 'Rainy', 'Cloudy', 'Windy', 'Stormy'];
    const nouns = ['Day', 'Night', 'Morning', 'Evening', 'Afternoon'];
    const randomAdjective = adjectives[Math.floor(Math.random() * adjectives.length)];
    const randomNoun = nouns[Math.floor(Math.random() * nouns.length)];
    return `${randomAdjective}${randomNoun}.txt`;
}

// Main function to execute the program
function main() {
    // Declare a variable to hold the name of the file to be read
    let fileName = 'example.txt';

    // Call the function to read the file contents
    readFileContents(fileName);

    // Generate a random file name (just for fun)
    let randomFileName = generateRandomFileName();
    console.log('Random File Name:', randomFileName);
}

// Call the main function to start the program
main();

/**
 */