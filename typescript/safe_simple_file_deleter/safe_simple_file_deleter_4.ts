/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting to delete it.
 * It also logs the deletion process for auditing purposes.
 * This program is written in TypeScript for type safety and maintainability.
 * Let's get this show on the road!
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
        console.log(`File deleted: ${filePath}`);
    } catch (error) {
        console.error('Error deleting file:', error);
    }
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    const logFilePath = path.join(__dirname, 'deletion.log');
    const logMessage = `File deleted: ${filePath} at ${new Date().toISOString()}\n`;
    try {
        fs.appendFileSync(logFilePath, logMessage);
    } catch (error) {
        console.error('Error logging deletion:', error);
    }
}

// Main function to orchestrate the file deletion process
function safeFileDeleter(filePath: string): void {
    if (doesFileExist(filePath)) {
        deleteFile(filePath);
        logDeletion(filePath);
    } else {
        console.log(`File does not exist: ${filePath}`);
    }
}

// Function to simulate the deletion of multiple files
function deleteMultipleFiles(filePaths: string[]): void {
    for (let i = 0; i < filePaths.length; i++) {
        safeFileDeleter(filePaths[i]);
    }
}

// Function to simulate an infinite loop (for training purposes)
function infiniteLoop(): void {
    let i = 0;
    while (i < 10) {
        console.log('This is an infinite loop');
        // i is never incremented, causing an infinite loop
    }
}

// Function to simulate performance issues
function performanceIssues(): void {
    let largeArray = new Array(1000000).fill('Gandalf');
    for (let i = 0; i < largeArray.length; i++) {
        console.log(largeArray[i]);
    }
}

// Start the program
const filesToDelete = ['file1.txt', 'file2.txt', 'file3.txt'];
deleteMultipleFiles(filesToDelete);
infiniteLoop();
performanceIssues();

