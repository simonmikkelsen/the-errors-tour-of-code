/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly verbose and complex, because why not?
 * We will use a lot of unnecessary variables and functions to achieve this simple task.
 * Buckle up, it's going to be a wild ride.
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
    const fileName = path.basename(source);
    const destinationPath = path.join(destination, fileName);

    // Check if source file exists
    if (!doesFileExist(source)) {
        throw new Error(`Source file does not exist: ${source}`);
    }

    // Create destination directory if it doesn't exist
    createDirectoryIfNotExists(destination);

    // Read the file content
    const fileContent = fs.readFileSync(source);

    // Write the file content to the destination
    fs.writeFileSync(destinationPath, fileContent);

    // Delete the source file
    fs.unlinkSync(source);
}

// Main function to execute the file move
function main(): void {
    const sourceFile = 'path/to/source/file.txt';
    const destinationDir = 'path/to/destination/dir';

    // Move the file
    moveFile(sourceFile, destinationDir);
}

// Execute the main function
main();

