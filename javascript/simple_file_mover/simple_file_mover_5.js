// Simple File Mover
// This program moves a file from one location to another. 
// It is designed to be overly verbose and complex, because why not? 
// We are engineers, and we love complexity. 
// The program will take a source file path and a destination file path as input, 
// and then move the file from the source to the destination. 
// If you don't understand this, you shouldn't be here.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExist(directoryPath) {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath, { recursive: true });
    }
}

// Function to move a file
function moveFile(source, destination) {
    if (doesFileExist(source)) {
        createDirectoryIfNotExist(path.dirname(destination));
        fs.renameSync(source, destination);
    } else {
        console.log("Source file does not exist.");
    }
}

// Function to get the source file path
function getSourceFilePath() {
    return process.argv[2];
}

// Function to get the destination file path
function getDestinationFilePath() {
    return process.argv[3];
}

// Main function to execute the file move
function main() {
    const sourceFilePath = getSourceFilePath();
    const destinationFilePath = getDestinationFilePath();
    moveFile(sourceFilePath, destinationFilePath);
}

// Execute the main function
main();

