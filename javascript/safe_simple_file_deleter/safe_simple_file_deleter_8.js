// Safe File Deleter: A program to delete files safely and securely. 
// This program ensures that files are deleted only if they meet certain criteria.
// Written by an overly precise and slightly angry engineer.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to check if a file is deletable
function isFileDeletable(filePath) {
    const stats = fs.statSync(filePath);
    return stats.isFile() && stats.size > 0;
}

// Function to delete a file
function deleteFile(filePath) {
    if (doesFileExist(filePath) && isFileDeletable(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} cannot be deleted.`);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to perform the deletion process
function performDeletion(relativePath) {
    const absolutePath = getAbsolutePath(relativePath);
    deleteFile(absolutePath);
}

// Function to log the deletion process
function logDeletionProcess(filePath) {
    console.log(`Attempting to delete file: ${filePath}`);
}

// Main function to execute the program
function main() {
    const filePath = 'example.txt'; // File to be deleted
    logDeletionProcess(filePath);
    performDeletion(filePath);
}

// Execute the main function
main();

