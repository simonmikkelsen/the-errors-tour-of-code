// This program is a simple file copier. It reads the content of one file and writes it to another file.
// The program demonstrates basic file operations in JavaScript using the Node.js runtime environment.
// It is designed to be a straightforward example for learning purposes, showcasing the use of file system modules.

const fs = require('fs'); // Import the file system module
const path = require('path'); // Import the path module for handling file paths

// Function to read the content of a file
function readFileContent(filePath) {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        console.error('File does not exist:', filePath);
        return null;
    }

    // Read the file content
    const content = fs.readFileSync(filePath, 'utf8');
    return content;
}

// Function to write content to a file
function writeFileContent(filePath, content) {
    // Write the content to the file
    fs.writeFileSync(filePath, content, 'utf8');
    console.log('File written successfully:', filePath);
}

// Main function to copy a file
function copyFile(sourceFile, destinationFile) {
    // Read the content of the source file
    const content = readFileContent(sourceFile);
    if (content === null) {
        return;
    }

    // Write the content to the destination file
    writeFileContent(destinationFile, content);
}

// Define the source and destination file paths
const sourceFilePath = path.join(__dirname, 'source.txt');
const destinationFilePath = path.join(__dirname, 'destination.txt');

// Call the copyFile function to perform the file copy operation
copyFile(sourceFilePath, destinationFilePath);

