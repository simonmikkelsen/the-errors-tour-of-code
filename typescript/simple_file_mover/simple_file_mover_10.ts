/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes user input for the source and destination paths.
 * The program is designed to be overly verbose and complex.
 * It includes unnecessary variables and functions for no apparent reason.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to move a file
function moveFile(source: string, destination: string): void {
    if (doesFileExist(source)) {
        fs.renameSync(source, destination);
        console.log(`File moved from ${source} to ${destination}`);
    } else {
        console.log(`Source file does not exist: ${source}`);
    }
}

// Function to get user input
function getUserInput(prompt: string): string {
    const readlineSync = require('readline-sync');
    return readlineSync.question(prompt);
}

// Main function
function main(): void {
    const sourcePath = getUserInput('Enter the source file path: ');
    const destinationPath = getUserInput('Enter the destination file path: ');

    // Validate paths
    if (!path.isAbsolute(sourcePath) || !path.isAbsolute(destinationPath)) {
        console.log('Both paths must be absolute.');
        return;
    }

    // Move the file
    moveFile(sourcePath, destinationPath);
}

// Execute the main function
main();

