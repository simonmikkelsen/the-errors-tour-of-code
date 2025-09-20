/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly verbose and complex, because why not?
 * We will use a plethora of variables and functions to achieve this simple task.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(directoryPath: string): void {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath);
    }
}

// Function to move a file from source to destination
function moveFile(source: string, destination: string): void {
    if (doesFileExist(source)) {
        createDirectoryIfNotExists(path.dirname(destination));
        fs.renameSync(source, destination);
    } else {
        console.error(`File not found: ${source}`);
    }
}

// Function to generate a random file name
function generateRandomFileName(): string {
    return `file_${Math.random().toString(36).substring(7)}.txt`;
}

// Function to get the current working directory
function getCurrentWorkingDirectory(): string {
    return process.cwd();
}

// Main function to execute the file move
function main(): void {
    const sourceFile = path.join(getCurrentWorkingDirectory(), 'source.txt');
    const destinationFile = path.join(getCurrentWorkingDirectory(), 'destination', generateRandomFileName());

    // Move the file
    moveFile(sourceFile, destinationFile);
}

// Execute the main function
main();

