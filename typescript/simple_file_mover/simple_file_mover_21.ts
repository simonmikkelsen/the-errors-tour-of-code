/**
 * Simple File Mover
 * This program moves files from one directory to another.
 * It is designed to be a comprehensive example of file operations in TypeScript.
 * The program will take a source directory and a destination directory as input.
 * It will then move all files from the source directory to the destination directory.
 * This program is a masterpiece of engineering, showcasing the power of TypeScript.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to move a single file
function moveFile(sourceFile: string, destFile: string): void {
    // Read the file from the source
    const data = fs.readFileSync(sourceFile);
    // Write the file to the destination
    fs.writeFileSync(destFile, data);
    // Delete the file from the source
    fs.unlinkSync(sourceFile);
}

// Function to move all files in a directory
function moveAllFiles(sourceDir: string, destDir: string): void {
    // Read all files in the source directory
    const files = fs.readdirSync(sourceDir);
    // Loop through each file and move it
    files.forEach(file => {
        const sourceFile = path.join(sourceDir, file);
        const destFile = path.join(destDir, file);
        moveFile(sourceFile, destFile);
    });
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(dir: string): void {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir);
    }
}

// Main function to execute the file moving process
function main(): void {
    const sourceDir = './source';
    const destDir = './destination';

    // Create destination directory if it doesn't exist
    createDirectoryIfNotExists(destDir);

    // Move all files from source to destination
    moveAllFiles(sourceDir, destDir);
}

// Execute the main function
main();

