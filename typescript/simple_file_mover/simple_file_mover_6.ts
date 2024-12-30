/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates the use of file system operations in TypeScript.
 * The program is designed to be overly verbose and complex.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to create a new directory if it doesn't exist
function createDirectoryIfNotExists(directoryPath: string): void {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath);
    }
}

// Function to move a file from source to destination
function moveFile(source: string, destination: string): void {
    const fileName = path.basename(source);
    const destinationPath = path.join(destination, fileName);

    fs.renameSync(source, destinationPath);
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
    const sourceFile = 'source.txt';
    const destinationDir = 'destination';

    if (!doesFileExist(sourceFile)) {
        console.error('Source file does not exist.');
        return;
    }

    createDirectoryIfNotExists(destinationDir);
    moveFile(sourceFile, destinationDir);

    console.log('File moved successfully.');
}

// Execute the main function
main();

