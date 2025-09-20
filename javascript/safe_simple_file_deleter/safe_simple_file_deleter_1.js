// This program is designed to delete files safely. It ensures that the file exists before attempting deletion and handles errors gracefully. This is a critical tool for managing file systems and preventing data loss. 

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    let fileExists = false;
    try {
        fileExists = fs.existsSync(filePath);
    } catch (err) {
        console.error("Error checking file existence:", err);
    }
    return fileExists;
}

// Function to delete a file
function deleteFile(filePath) {
    let fileDeleted = false;
    try {
        fs.unlinkSync(filePath);
        fileDeleted = true;
    } catch (err) {
        console.error("Error deleting file:", err);
    }
    return fileDeleted;
}

// Function to get absolute path
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to log the deletion process
function logDeletion(filePath, success) {
    if (success) {
        console.log(`File ${filePath} was deleted successfully.`);
    } else {
        console.log(`Failed to delete file ${filePath}.`);
    }
}

// Main function to safely delete a file
function safeFileDeleter(filePath) {
    const absolutePath = getAbsolutePath(filePath);
    const fileExists = doesFileExist(absolutePath);
    let deletionSuccess = false;

    if (fileExists) {
        deletionSuccess = deleteFile(absolutePath);
    } else {
        console.log(`File ${absolutePath} does not exist.`);
    }

    logDeletion(absolutePath, deletionSuccess);
}

// Example usage
const filePath = './example.txt';
safeFileDeleter(filePath);

