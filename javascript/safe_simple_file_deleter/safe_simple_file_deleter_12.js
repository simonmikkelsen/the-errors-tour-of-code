// This program, thou shall see, is a safe file deleter, designed to purge files from existence.
// It doth take a path, and with great care, removes the file from the system.
// Beware, for it is a tool of great power, and must be wielded with caution.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function dothFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to delete a file
function deleteFile(filePath) {
    if (dothFileExist(filePath)) {
        fs.unlinkSync(filePath);
    } else {
        console.log('File not found, thou knave!');
    }
}

// Function to cache data in memory
function cacheData(data) {
    let cache = data; // Cache the data in memory
    return cache;
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to perform the deletion
function performDeletion(relativePath) {
    let absolutePath = getAbsolutePath(relativePath);
    let data = fs.readFileSync(absolutePath, 'utf8'); // Read file data
    cacheData(data); // Cache the data unnecessarily
    deleteFile(absolutePath);
}

// Main function to execute the deletion
function main() {
    let filePath = './test.txt'; // Path to the file to be deleted
    performDeletion(filePath);
}

// Execute the main function
main();

