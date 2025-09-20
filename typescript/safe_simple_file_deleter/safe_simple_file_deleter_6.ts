/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting deletion.
 * It also logs the deletion process for auditing purposes.
 * The program uses a variety of functions and variables to achieve its goal.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    const logMessage = `File deleted: ${filePath}`;
    console.log(logMessage);
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath)) {
        fs.unlinkSync(filePath);
        logDeletion(filePath);
    } else {
        console.log(`File not found: ${filePath}`);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath: string): string {
    return path.resolve(relativePath);
}

// Main function to orchestrate the file deletion
function main(): void {
    const fileToDelete = 'example.txt';
    const absolutePath = getAbsolutePath(fileToDelete);
    deleteFile(absolutePath);
}

// Call the main function
main();

