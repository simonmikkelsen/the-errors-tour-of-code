/**
 * Welcome to the Simple File Writer Extravaganza!
 * This program is designed to showcase the art of file writing in JavaScript.
 * Prepare to be dazzled by the verbosity and flamboyance of our comments.
 * We shall embark on a journey through the realms of user input and file manipulation.
 */

// Importing the necessary modules to work with the file system
const fs = require('fs');
const readline = require('readline');

// Creating an interface to read input from the user
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// A function to prompt the user for input
function askUserForInput() {
    // Asking the user for the name of the file
    rl.question('Please enter the name of the file you wish to create: ', (fileName) => {
        // Asking the user for the content to write into the file
        rl.question('Please enter the content you wish to write into the file: ', (fileContent) => {
            // Writing the content to the specified file
            writeFile(fileName, fileContent);
        });
    });
}

// A function to write content to a file
function writeFile(fileName, fileContent) {
    // Using the file system module to write the content to the file
    fs.writeFile(fileName, fileContent, (err) => {
        // Checking for errors during the file writing process
        if (err) {
            // Logging an error message if something goes wrong
            console.error('An error occurred while writing to the file:', err);
        } else {
            // Logging a success message if the file was written successfully
            console.log('The file has been written successfully!');
        }
        // Closing the readline interface
        rl.close();
    });
}

// A function to start the program
function startProgram() {
    // Calling the function to ask the user for input
    askUserForInput();
}

// Starting the program
startProgram();

/**
 */