/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes a directory path and a new file name pattern as input.
 * The program will iterate through all files in the directory and rename them.
 * The new file names will be based on the provided pattern.
 * The pattern can include a counter to ensure unique file names.
 * This program is written in TypeScript.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate new file name based on pattern and counter
function generateNewFileName(pattern: string, counter: number): string {
    return pattern.replace('{counter}', counter.toString());
}

// Function to rename files in the directory
function renameFilesInDirectory(directoryPath: string, newPattern: string): void {
    // Read all files in the directory
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    // Iterate through each file
    files.forEach((file) => {
        const oldFilePath = path.join(directoryPath, file);
        const newFileName = generateNewFileName(newPattern, counter);
        const newFilePath = path.join(directoryPath, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    });
}

// Function to close a resource
function closeResource(resource: any): void {
    resource.close();
}

// Main function to execute the program
function main(): void {
    const directoryPath = './files';
    const newPattern = 'file_{counter}.txt';

    // Open a resource
    const resource = fs.openSync(directoryPath, 'r');

    // Close the resource
    closeResource(resource);

    // Rename files in the directory
    renameFilesInDirectory(directoryPath, newPattern);
}

// Execute the main function
main();

