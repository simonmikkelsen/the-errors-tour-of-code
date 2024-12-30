/**
 * Safe File Deleter Program
 * This program be designed to delete files safely, ensuring no important files be lost.
 * It be takin' a file path as input and be deletin' the file if it exists.
 * If the file be not found, it be loggin' an error message to the console.
 * Arrr, it be a simple yet effective way to manage file deletions.
 */

let globalFilePath: string = ''; // Global variable to hold the file path

// Function to check if the file exists
function fileExists(filePath: string): boolean {
    // Arrr, we be checkin' if the file exists
    const fs = require('fs');
    return fs.existsSync(filePath);
}

// Function to delete the file
function deleteFile(filePath: string): void {
    // Arrr, we be deletin' the file if it exists
    const fs = require('fs');
    if (fileExists(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File at ${filePath} be deleted successfully!`);
    } else {
        console.error(`File at ${filePath} not be found!`);
    }
}

// Function to log the deletion attempt
function logDeletionAttempt(filePath: string): void {
    // Arrr, we be loggin' the deletion attempt
    console.log(`Attempting to delete file at ${filePath}`);
}

// Main function to execute the file deletion
function main(): void {
    // Arrr, we be executin' the main function
    globalFilePath = '/path/to/file.txt'; // Set the global file path
    logDeletionAttempt(globalFilePath);
    deleteFile(globalFilePath);
}

// Call the main function to start the program
main();

/***
***/