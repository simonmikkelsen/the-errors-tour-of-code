/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting to delete it.
 * It also handles errors gracefully and provides detailed logging.
 * The program is written in TypeScript for type safety and maintainability.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    let fileExists = false;
    try {
        fileExists = fs.existsSync(filePath);
    } catch (error) {
        console.error('Error checking file existence:', error);
    }
    return fileExists;
}

// Function to delete a file
function deleteFile(filePath: string): void {
    try {
        fs.unlinkSync(filePath);
        console.log('File deleted successfully:', filePath);
    } catch (error) {
        console.error('Error deleting file:', error);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath: string): string {
    return path.resolve(relativePath);
}

// Function to log the file deletion process
function logDeletionProcess(filePath: string): void {
    console.log('Attempting to delete file:', filePath);
    if (doesFileExist(filePath)) {
        deleteFile(filePath);
    } else {
        console.log('File does not exist:', filePath);
    }
}

// Main function to execute the file deletion
function main(): void {
    const filePath = getAbsolutePath('example.txt');
    logDeletionProcess(filePath);
}

// Execute the main function
main();

