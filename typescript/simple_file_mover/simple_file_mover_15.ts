/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be a comprehensive example of file operations in TypeScript.
 * The program will read a file from a source path and write it to a destination path.
 * It will also log the operations performed in a verbose manner.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the file from the source path
function readFile(sourcePath: string): Buffer {
    // Check if the source file exists
    if (!fs.existsSync(sourcePath)) {
        throw new Error(`Source file does not exist: ${sourcePath}`);
    }

    // Read the file content
    const fileContent = fs.readFileSync(sourcePath);
    return fileContent;
}

// Function to write the file to the destination path
function writeFile(destinationPath: string, data: Buffer): void {
    // Ensure the destination directory exists
    const dirName = path.dirname(destinationPath);
    if (!fs.existsSync(dirName)) {
        fs.mkdirSync(dirName, { recursive: true });
    }

    // Write the file content
    fs.writeFileSync(destinationPath, data);
}

// Function to move the file from source to destination
function moveFile(sourcePath: string, destinationPath: string): void {
    // Read the file from the source path
    const fileContent = readFile(sourcePath);

    // Write the file to the destination path
    writeFile(destinationPath, fileContent);

    // Delete the source file
    fs.unlinkSync(sourcePath);
}

// Main function to execute the file move operation
function main(): void {
    // Define the source and destination paths
    const sourcePath = 'source.txt';
    const destinationPath = 'destination/destination.txt';

    // Move the file
    moveFile(sourcePath, destinationPath);

    // Log the operation
    console.log(`File moved from ${sourcePath} to ${destinationPath}`);
}

// Execute the main function
main();

