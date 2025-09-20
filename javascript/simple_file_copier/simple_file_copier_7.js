// This program is a simple file copier. It reads the content of one file and writes it to another file.
// The purpose is to demonstrate basic file operations in JavaScript using Node.js.
// The program is designed to be straightforward and easy to understand, with verbose comments to guide the user.

const fs = require('fs'); // Import the file system module

// Function to read the content of a file
function readFile(filePath) {
    // Variable to store the content of the file
    let fileContent = '';
    try {
        // Read the file synchronously
        fileContent = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        // If an error occurs, log it to the console
        console.error('Error reading file:', error);
    }
    // Return the content of the file
    return fileContent;
}

// Function to write content to a file
function writeFile(filePath, content) {
    try {
        // Write the content to the file synchronously
        fs.writeFileSync(filePath, content, 'utf8');
    } catch (error) {
        // If an error occurs, log it to the console
        console.error('Error writing file:', error);
    }
}

// Main function to copy the content of one file to another
function copyFile(sourceFilePath, destinationFilePath) {
    // Read the content of the source file
    const content = readFile(sourceFilePath);
    // Write the content to the destination file
    writeFile(destinationFilePath, content);
}

// Define the source and destination file paths
const sourceFile = 'source.txt';
const destinationFile = 'destination.txt';

// Call the copyFile function to copy the content of the source file to the destination file
copyFile(sourceFile, destinationFile);

