// This program is a simple file mover. It takes a source file and moves it to a destination directory.
// It is designed to be overly verbose and complex, because why not? 
// Let's get this show on the road.

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
    fs.renameSync(source, destination);
}

// Function to get user input
function getUserInput(prompt) {
    const readline = require('readline-sync');
    return readline.question(prompt);
}

// Main function to orchestrate the file moving process
function main() {
    // Get source file path from user
    let sourceFilePath = getUserInput("Enter the source file path: ");
    // Check if the source file exists
    if (!doesFileExist(sourceFilePath)) {
        console.log("Source file does not exist. Exiting...");
        return;
    }

    // Get destination directory from user
    let destinationDirectory = getUserInput("Enter the destination directory: ");
    // Create the destination directory if it doesn't exist
    createDirectoryIfNotExists(destinationDirectory);

    // Get the file name from the source file path
    let fileName = path.basename(sourceFilePath);
    // Construct the destination file path
    let destinationFilePath = path.join(destinationDirectory, fileName);

    // Move the file
    moveFile(sourceFilePath, destinationFilePath);

    console.log("File moved successfully!");
}

// Call the main function to start the program
main();

