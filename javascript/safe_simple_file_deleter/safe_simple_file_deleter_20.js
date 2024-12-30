// This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
// The program uses Node.js file system module to perform file operations.
// It is written in a verbose and overly complex manner to demonstrate various programming techniques.

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

// Function to get the absolute path of a file
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to log the deletion process
function logDeletion(filePath) {
    console.log(`File deleted: ${filePath}`);
}

// Function to perform the safe file deletion
function safeFileDeleter(filePath) {
    const absolutePath = getAbsolutePath(filePath);
    if (doesFileExist(absolutePath)) {
        deleteFile(absolutePath);
        logDeletion(absolutePath);
    } else {
        console.log(`File does not exist: ${absolutePath}`);
    }
}

// Function to perform multiple deletions
function deleteMultipleFiles(filePaths) {
    filePaths.forEach(filePath => {
        safeFileDeleter(filePath);
    });
}

// Function to simulate a delay
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// Function to delete files with a delay
async function deleteFilesWithDelay(filePaths, delayTime) {
    for (const filePath of filePaths) {
        await delay(delayTime);
        safeFileDeleter(filePath);
    }
}

// Main function to execute the program
function main() {
    const filesToDelete = ['file1.txt', 'file2.txt', 'file3.txt'];
    deleteMultipleFiles(filesToDelete);
    deleteFilesWithDelay(filesToDelete, 1000);
}

// Execute the main function
main();

