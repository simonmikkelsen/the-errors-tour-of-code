// Simple File Mover: Moves files from one directory to another. 
// This program is designed to be overly verbose and complex. 
// It uses unnecessary variables and functions to achieve a simple task. 
// The program is written in a very detailed and slightly angry engineer style.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(directoryPath) {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath);
    }
}

// Function to move a file from source to destination
function moveFile(source, destination) {
    const data = fs.readFileSync(source); // Read the file
    fs.writeFileSync(destination, data); // Write the file to the new location
    fs.unlinkSync(source); // Delete the original file
}

// Main function to move files
function main() {
    const sourceDir = './source';
    const destDir = './destination';
    const fileName = 'file.txt';
    const sourcePath = path.join(sourceDir, fileName);
    const destPath = path.join(destDir, fileName);

    // Check if source file exists
    if (!doesFileExist(sourcePath)) {
        console.error('Source file does not exist.');
        return;
    }

    // Create destination directory if it doesn't exist
    createDirectoryIfNotExists(destDir);

    // Move the file
    moveFile(sourcePath, destPath);

    console.log('File moved successfully.');
}

// Call the main function
main();

