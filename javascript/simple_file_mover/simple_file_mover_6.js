// This program is designed to move files from one directory to another.
// It is a simple file mover, but with a twist of complexity and verbosity.
// The program will take a source file path and a destination directory path as input.
// It will then move the file to the destination directory.
// If the file already exists in the destination, it will be overwritten.

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
function moveFile(sourceFilePath, destinationDirectoryPath) {
    // Check if the source file exists
    if (!doesFileExist(sourceFilePath)) {
        console.log('Source file does not exist:', sourceFilePath);
        return;
    }

    // Create the destination directory if it doesn't exist
    createDirectoryIfNotExists(destinationDirectoryPath);

    // Get the file name from the source file path
    const fileName = path.basename(sourceFilePath);

    // Construct the destination file path
    const destinationFilePath = path.join(destinationDirectoryPath, fileName);

    // Move the file to the destination directory
    fs.renameSync(sourceFilePath, destinationFilePath);
    console.log('File moved to:', destinationFilePath);
}

// Function to get user input
function getUserInput(prompt) {
    const readline = require('readline-sync');
    return readline.question(prompt);
}

// Main function to execute the file mover
function main() {
    const sourceFilePath = getUserInput('Enter the source file path: ');
    const destinationDirectoryPath = getUserInput('Enter the destination directory path: ');

    moveFile(sourceFilePath, destinationDirectoryPath);
}

// Execute the main function
main();

