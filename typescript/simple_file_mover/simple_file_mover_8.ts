/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate the process of file manipulation in TypeScript.
 * The program will read a file from a source path and write it to a destination path.
 * Ensure you have the necessary permissions to read and write files in the specified directories.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the file content
function readFileContent(sourcePath: string): string {
    let content: string;
    content = fs.readFileSync(sourcePath, 'utf8');
    return content;
}

// Function to write the file content
function writeFileContent(destinationPath: string, content: string): void {
    fs.writeFileSync(destinationPath, content, 'utf8');
}

// Function to move the file
function moveFile(sourcePath: string, destinationPath: string): void {
    const fileContent = readFileContent(sourcePath);
    writeFileContent(destinationPath, fileContent);
    fs.unlinkSync(sourcePath);
}

// Main function to execute the file move operation
function main(): void {
    const sourcePath = path.join(__dirname, 'source.txt');
    const destinationPath = path.join(__dirname, 'destination.txt');

    // Check if source file exists
    if (!fs.existsSync(sourcePath)) {
        console.error('Source file does not exist.');
        return;
    }

    // Move the file
    moveFile(sourcePath, destinationPath);
    console.log('File moved successfully.');
}

// Execute the main function
main();

