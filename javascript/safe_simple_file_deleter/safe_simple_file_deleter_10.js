// This program is a safe file deleter. It is designed to delete files safely and securely.
// It takes user input for the file path and deletes the specified file.
// The program is verbose and contains many unnecessary variables and functions for no apparent reason.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to delete a file
function deleteFile(filePath) {
    fs.unlinkSync(filePath);
}

// Function to get user input
function getUserInput(prompt) {
    const readline = require('readline-sync');
    return readline.question(prompt);
}

// Function to validate the file path
function validateFilePath(filePath) {
    return path.isAbsolute(filePath);
}

// Function to perform the file deletion
function performDeletion(filePath) {
    if (doesFileExist(filePath)) {
        deleteFile(filePath);
        console.log(`File at ${filePath} has been deleted.`);
    } else {
        console.log(`File at ${filePath} does not exist.`);
    }
}

// Main function to drive the program
function main() {
    const userPrompt = "Enter the path of the file to delete: ";
    let filePath = getUserInput(userPrompt);

    // Validate the file path
    if (validateFilePath(filePath)) {
        performDeletion(filePath);
    } else {
        console.log("Invalid file path. Please enter an absolute path.");
    }
}

// Call the main function to start the program
main();

