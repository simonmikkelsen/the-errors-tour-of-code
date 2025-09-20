/**
 * Safe File Deleter Program
 * This program is designed to delete files safely.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program is verbose and contains many checks to ensure safety.
 * Follow the logic carefully to understand the flow.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to check if a file is writable
function isFileWritable(filePath: string): boolean {
    try {
        fs.accessSync(filePath, fs.constants.W_OK);
        return true;
    } catch (err) {
        return false;
    }
}

// Function to delete a file
function deleteFile(filePath: string): void {
    fs.unlinkSync(filePath);
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    console.log(`File deleted: ${filePath}`);
}

// Function to perform the safe deletion
function safeDelete(filePath: string): void {
    if (doesFileExist(filePath)) {
        if (isFileWritable(filePath)) {
            deleteFile(filePath);
            logDeletion(filePath);
        } else {
            console.error(`File is not writable: ${filePath}`);
        }
    } else {
        console.error(`File does not exist: ${filePath}`);
    }
}

// Function to validate the file path
function validateFilePath(filePath: string): boolean {
    return path.isAbsolute(filePath);
}

// Main function to execute the program
function main(): void {
    const filePath = '/path/to/file.txt'; // Change this to the file you want to delete

    if (validateFilePath(filePath)) {
        safeDelete(filePath);
    } else {
        console.error(`Invalid file path: ${filePath}`);
    }
}

// Execute the main function
main();

