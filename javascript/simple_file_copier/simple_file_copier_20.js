// This program is a simple file copier. It reads the contents of one file and writes it to another file.
// The program demonstrates basic file operations in JavaScript using the 'fs' module.
// It is designed to be a learning tool for understanding file I/O operations in Node.js.
// The program is written in a verbose and colorful style, with many comments to explain each step.

const fs = require('fs');

// Function to read the contents of a file
function readFile(filePath, callback) {
    // Read the file asynchronously
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            // If an error occurs, log it and return
            console.error('Error reading file:', err);
            return;
        }
        // Call the callback function with the file data
        callback(data);
    });
}

// Function to write data to a file
function writeFile(filePath, data, callback) {
    // Write the file asynchronously
    fs.writeFile(filePath, data, 'utf8', (err) => {
        if (err) {
            // If an error occurs, log it and return
            console.error('Error writing file:', err);
            return;
        }
        // Call the callback function to indicate success
        callback();
    });
}

// Function to copy a file
function copyFile(sourcePath, destinationPath) {
    // Read the source file
    readFile(sourcePath, (data) => {
        // Write the data to the destination file
        writeFile(destinationPath, data, () => {
            // Log a success message
            console.log('File copied successfully from', sourcePath, 'to', destinationPath);
        });
    });
}

// Define the source and destination file paths
const sourceFile = 'source.txt';
const destinationFile = 'destination.txt';

// Call the copyFile function to copy the file
copyFile(sourceFile, destinationFile);

