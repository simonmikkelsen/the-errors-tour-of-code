// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a lot of unnecessary variables and functions to make it more interesting.

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
    const fileName = path.basename(source);
    const destPath = path.join(destination, fileName);

    // Check if the source file exists
    if (doesFileExist(source)) {
        // Create the destination directory if it doesn't exist
        createDirectoryIfNotExists(destination);

        // Move the file
        fs.renameSync(source, destPath);
    }
}

// Function to get the current working directory
function getCurrentDirectory(): string {
    return process.cwd();
}

// Function to get the absolute path of a file
function getAbsolutePath(relativePath: string): string {
    return path.resolve(relativePath);
}

// Main function to execute the file move operation
function main(): void {
    const sourceFile = getAbsolutePath('source.txt');
    const destinationDir = getAbsolutePath('destination');

    // Move the file
    moveFile(sourceFile, destinationDir);
}

// Execute the main function
main();

