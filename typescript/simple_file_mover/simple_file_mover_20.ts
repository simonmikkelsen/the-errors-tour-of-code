/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate the intricacies of file handling in TypeScript.
 * Pay attention to the details, as they are crucial for understanding the process.
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

// Function to move a file
function moveFile(source: string, destination: string): void {
    const fileName = path.basename(source);
    const destinationPath = path.join(destination, fileName);

    // Check if source file exists
    if (!doesFileExist(source)) {
        throw new Error(`Source file does not exist: ${source}`);
    }

    // Ensure the destination directory exists
    createDirectoryIfNotExists(destination);

    // Read the file content
    const fileContent = fs.readFileSync(source);

    // Write the file to the new location
    fs.writeFileSync(destinationPath, fileContent);

    // Delete the original file
    fs.unlinkSync(source);
}

// Main function to execute the file move
function main(): void {
    const sourceFile = 'source.txt';
    const destinationDir = 'destination';

    // Move the file
    moveFile(sourceFile, destinationDir);

    // Log the success message
    console.log(`File moved from ${sourceFile} to ${destinationDir}`);
}

// Execute the main function
main();

/**
 */