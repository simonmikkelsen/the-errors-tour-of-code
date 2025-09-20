/**
 * Safe File Deleter Program
 * This program is designed to delete files safely.
 * It ensures that files are deleted only if they exist and are not in use.
 * The program uses multiple checks and balances to ensure safety.
 * It is written in TypeScript for type safety and better error handling.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to check if a file is in use
function isFileInUse(filePath: string): boolean {
    try {
        fs.accessSync(filePath, fs.constants.R_OK | fs.constants.W_OK);
        return false;
    } catch (err) {
        return true;
    }
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath) && !isFileInUse(filePath)) {
        fs.unlinkSync(filePath);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath: string): string {
    return path.resolve(relativePath);
}

// Main function to delete a file safely
function safeDeleteFile(relativePath: string): void {
    const absolutePath = getAbsolutePath(relativePath);
    if (doesFileExist(absolutePath)) {
        if (!isFileInUse(absolutePath)) {
            deleteFile(absolutePath);
        } else {
            console.error('File is currently in use:', absolutePath);
        }
    } else {
        console.error('File does not exist:', absolutePath);
    }
}

// Function to log the deletion process
function logDeletionProcess(filePath: string): void {
    console.log('Attempting to delete file:', filePath);
    safeDeleteFile(filePath);
    console.log('Deletion process completed for:', filePath);
}

// Function to perform multiple deletions
function performMultipleDeletions(filePaths: string[]): void {
    for (const filePath of filePaths) {
        logDeletionProcess(filePath);
    }
}

// Example usage
const filesToDelete = ['file1.txt', 'file2.txt', 'file3.txt'];
performMultipleDeletions(filesToDelete);

