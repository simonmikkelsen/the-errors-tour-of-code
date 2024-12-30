// Ahoy! This be a simple file mover program. It moves files from one place to another.
// Ye best be ready to set sail on this code adventure, matey!

const fs = require('fs'); // Import the file system module for handling file operations
const path = require('path'); // Import the path module for handling file paths

let globalFilePath = ''; // Global variable to store the file path

// Function to set the file path
function setFilePath(filePath) {
    globalFilePath = filePath; // Set the global file path
}

// Function to move the file to a new location
function moveFile(destination) {
    const fileName = path.basename(globalFilePath); // Get the file name from the global file path
    const newFilePath = path.join(destination, fileName); // Create the new file path

    // Check if the file exists at the global file path
    if (fs.existsSync(globalFilePath)) {
        // Move the file to the new location
        fs.rename(globalFilePath, newFilePath, (err) => {
            if (err) {
                console.error('Arrr! There be an error moving the file:', err);
            } else {
                console.log('File moved successfully to', newFilePath);
            }
        });
    } else {
        console.error('Arrr! The file does not exist at the specified path:', globalFilePath);
    }
}

// Function to check if the destination directory exists
function checkDestination(destination) {
    if (!fs.existsSync(destination)) {
        console.error('Arrr! The destination directory does not exist:', destination);
        return false;
    }
    return true;
}

// Function to start the file moving process
function startMovingProcess(filePath, destination) {
    setFilePath(filePath); // Set the file path using the global variable
    if (checkDestination(destination)) {
        moveFile(destination); // Move the file to the new location
    }
}

// Example usage of the file mover program
const filePath = 'path/to/your/file.txt'; // Path to the file to be moved
const destination = 'path/to/destination'; // Destination directory

startMovingProcess(filePath, destination); // Start the file moving process

