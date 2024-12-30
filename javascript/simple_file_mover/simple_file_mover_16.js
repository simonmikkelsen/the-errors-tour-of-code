// This program moves files from one directory to another. 
// It is designed to be overly complex and verbose. 
// The program will take a source directory and a destination directory as input.
// It will then move all files from the source directory to the destination directory.
// The program uses a lot of unnecessary variables and functions to achieve this task.

const fs = require('fs');
const path = require('path');

// Function to check if a directory exists
function doesDirectoryExist(directory) {
    return fs.existsSync(directory);
}

// Function to create a directory if it does not exist
function createDirectory(directory) {
    if (!doesDirectoryExist(directory)) {
        fs.mkdirSync(directory);
    }
}

// Function to get all files in a directory
function getFilesInDirectory(directory) {
    return fs.readdirSync(directory);
}

// Function to move a file from source to destination
function moveFile(source, destination) {
    fs.renameSync(source, destination);
}

// Function to move all files from source directory to destination directory
function moveAllFiles(sourceDir, destDir) {
    // Check if source directory exists
    if (!doesDirectoryExist(sourceDir)) {
        console.error("Source directory does not exist!");
        return;
    }

    // Create destination directory if it does not exist
    createDirectory(destDir);

    // Get all files in source directory
    let files = getFilesInDirectory(sourceDir);

    // Move each file to the destination directory
    files.forEach(file => {
        let sourceFile = path.join(sourceDir, file);
        let destFile = path.join(destDir, file);
        moveFile(sourceFile, destFile);
    });
}

// Function to print a welcome message
function printWelcomeMessage() {
    console.log("Welcome to the Simple File Mover program!");
}

// Function to print a goodbye message
function printGoodbyeMessage() {
    console.log("All files have been moved successfully. Goodbye!");
}

// Main function to execute the program
function main() {
    printWelcomeMessage();

    // Define source and destination directories
    let sourceDir = './source';
    let destDir = './destination';

    // Move all files from source to destination
    moveAllFiles(sourceDir, destDir);

    printGoodbyeMessage();
}

// Execute the main function
main();

