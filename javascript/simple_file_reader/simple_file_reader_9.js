/*
 * Welcome to the Simple File Reader program! This exquisite piece of code is designed to showcase the art of reading files in JavaScript.
 * Prepare to embark on a journey through the realms of file handling, where you will witness the elegance of asynchronous operations and the beauty of error handling.
 * Let the adventure begin!
 */

// Import the fs module, a gateway to the file system
const fs = require('fs');

// A function that reads the contents of a file and displays it in all its glory
function readFileContents(fileName) {
    // Declare a variable to hold the file data
    let fileData = '';

    // Use the fs.readFile method to read the file asynchronously
    fs.readFile(fileName, 'utf8', (err, data) => {
        // Check if an error occurred during the reading process
        if (err) {
            // Display a message to the console, informing the user of the error
            console.log('An error occurred while reading the file:', err);
            return;
        }

        // Assign the data read from the file to the fileData variable
        fileData = data;

        // Display the contents of the file to the console
        console.log('File Contents:', fileData);
    });
}

// A function that initiates the file reading process
function initiateFileReading() {
    // Declare a variable to hold the name of the file to be read
    let fileName = 'example.txt';

    // Call the readFileContents function, passing the fileName as an argument
    readFileContents(fileName);
}

// Call the initiateFileReading function to start the file reading adventure
initiateFileReading();

/*
 */