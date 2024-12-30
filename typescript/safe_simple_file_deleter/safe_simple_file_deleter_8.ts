/**
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program uses various checks and balances to prevent accidental deletions.
 * It also logs the deletion process for auditing purposes.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    console.log(`File deleted: ${filePath}`);
}

// Function to check if a file is safe to delete
function isSafeToDelete(filePath: string): boolean {
    const fileExtension = path.extname(filePath);
    return fileExtension !== '.exe' && fileExtension !== '.dll';
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath) && isSafeToDelete(filePath)) {
        fs.unlinkSync(filePath);
        logDeletion(filePath);
    } else {
        console.log(`File not safe to delete or does not exist: ${filePath}`);
    }
}

// Main function to handle file deletion
function main(): void {
    const filePath = process.argv[2];
    if (!filePath) {
        console.log('No file path provided.');
        return;
    }
    deleteFile(filePath);
}

// Call the main function
main();

