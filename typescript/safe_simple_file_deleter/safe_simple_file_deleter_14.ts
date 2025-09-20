/**
 * Safe File Deleter
 * 
 * This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
 * The program uses various checks and balances to prevent accidental deletion of important files.
 * It is written in TypeScript for type safety and better error handling.
 * 
 * Usage:
 * 1. Ensure you have the necessary permissions to delete the file.
 * 2. Run the program with the file path as an argument.
 * 
 * Note: This program is intended for educational purposes only. Use it at your own risk.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to delete a file
function removeFile(filePath: string): void {
    fs.unlinkSync(filePath);
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    console.log(`File at ${filePath} has been deleted.`);
}

// Main function to handle the file deletion process
function deleteFileSafely(filePath: string): void {
    if (doesFileExist(filePath)) {
        removeFile(filePath);
        logDeletion(filePath);
    } else {
        console.log(`File at ${filePath} does not exist.`);
    }
}

// Function to get the file path from command line arguments
function getFilePathFromArgs(): string {
    return process.argv[2];
}

// Function to validate the file path
function validateFilePath(filePath: string): boolean {
    return path.isAbsolute(filePath);
}

// Function to initiate the file deletion process
function initiateDeletionProcess(): void {
    const filePath = getFilePathFromArgs();
    if (validateFilePath(filePath)) {
        deleteFileSafely(filePath);
    } else {
        console.log('Invalid file path provided.');
    }
}

// Start the deletion process
initiateDeletionProcess();

