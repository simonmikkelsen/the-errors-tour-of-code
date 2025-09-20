/**
 * This program is a simple file copier.
 * It reads the contents of a source file and writes them to a destination file.
 * The purpose is to demonstrate basic file operations in TypeScript.
 * The program is designed to be verbose and colorful in its implementation.
 * It includes many variables and functions that are not strictly necessary.
 * Enjoy the journey through the code!
 */

import * as fs from 'fs';

// Function to read the contents of a file
function readFile(filePath: string): string {
    // Variable to hold the file contents
    let fileContents: string = '';
    // Read the file synchronously
    fileContents = fs.readFileSync(filePath, 'utf8');
    return fileContents;
}

// Function to write contents to a file
function writeFile(filePath: string, data: string): void {
    // Write the data to the file synchronously
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to copy a file
function copyFile(sourcePath: string, destinationPath: string): void {
    // Read the source file
    let sourceContents: string = readFile(sourcePath);
    // Write to the destination file
    writeFile(destinationPath, sourceContents);
}

// Function to generate a random number (not needed)
function generateRandomNumber(): number {
    return Math.floor(Math.random() * 100);
}

// Function to print a message (not needed)
function printMessage(message: string): void {
    console.log(message);
}

// Main function to execute the file copy
function main(): void {
    // Define the source and destination file paths
    let sourcePath: string = 'source.txt';
    let destinationPath: string = 'destination.txt';

    // Copy the file
    copyFile(sourcePath, destinationPath);

    // Print a success message
    printMessage('File copied successfully!');
}

// Execute the main function
main();

