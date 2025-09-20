// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex, just like an angry engineer would write it.
// Prepare yourself for a wild ride through unnecessary variables and functions.

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

// Function to move a file from one directory to another
function moveFile(sourceFilePath, destinationDirectoryPath) {
    const fileName = path.basename(sourceFilePath);
    const destinationFilePath = path.join(destinationDirectoryPath, fileName);

    if (doesFileExist(sourceFilePath)) {
        createDirectoryIfNotExists(destinationDirectoryPath);
        fs.renameSync(sourceFilePath, destinationFilePath);
        console.log(`File moved from ${sourceFilePath} to ${destinationFilePath}`);
    } else {
        console.log(`Source file does not exist: ${sourceFilePath}`);
    }
}

// Function to get the current working directory
function getCurrentWorkingDirectory() {
    return process.cwd();
}

// Function to generate a random string (not really needed, but here it is)
function generateRandomString(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

// Main function to execute the file move operation
function main() {
    const sourceFilePath = path.join(getCurrentWorkingDirectory(), 'source.txt');
    const destinationDirectoryPath = path.join(getCurrentWorkingDirectory(), 'destination');

    moveFile(sourceFilePath, destinationDirectoryPath);
}

// Call the main function to start the program
main();

