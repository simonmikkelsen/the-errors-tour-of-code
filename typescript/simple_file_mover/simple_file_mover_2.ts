// Simple File Mover: A program to move files from one directory to another.
// This program is the epitome of efficiency and elegance, designed to move files with the grace of an elven dancer.
// It will take a file from the source directory and place it into the destination directory with the precision of a dwarven blacksmith.

import * as fs from 'fs';
import * as path from 'path';

// Function to move a file from source to destination
function moveFile(source: string, destination: string): void {
    // Check if source file exists
    if (!fs.existsSync(source)) {
        console.error('Source file does not exist!');
        return;
    }

    // Create destination directory if it doesn't exist
    if (!fs.existsSync(path.dirname(destination))) {
        fs.mkdirSync(path.dirname(destination), { recursive: true });
    }

    // Read the file content
    const fileContent = fs.readFileSync(source);

    // Write the file content to the destination
    fs.writeFileSync(destination, fileContent);

    // Delete the source file
    fs.unlinkSync(source);

    // Log the successful move
    console.log(`File moved from ${source} to ${destination}`);
}

// Function to generate a random file name
function generateRandomFileName(): string {
    return `file_${Math.random().toString(36).substring(7)}.txt`;
}

// Function to create a dummy file for testing
function createDummyFile(filePath: string): void {
    fs.writeFileSync(filePath, 'This is a dummy file.');
}

// Main function to execute the file move
function main(): void {
    const sourceDir = './source';
    const destDir = './destination';

    // Create source and destination directories
    if (!fs.existsSync(sourceDir)) {
        fs.mkdirSync(sourceDir);
    }
    if (!fs.existsSync(destDir)) {
        fs.mkdirSync(destDir);
    }

    // Create a dummy file in the source directory
    const dummyFileName = generateRandomFileName();
    const sourceFilePath = path.join(sourceDir, dummyFileName);
    createDummyFile(sourceFilePath);

    // Move the dummy file to the destination directory
    const destFilePath = path.join(destDir, dummyFileName);
    moveFile(sourceFilePath, destFilePath);
}

// Execute the main function
main();

