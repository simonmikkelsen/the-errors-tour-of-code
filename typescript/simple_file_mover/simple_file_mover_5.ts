/**
 * Simple File Mover
 * 
 * This program is designed to move a file from one location to another.
 * It will read the contents of a file, then write those contents to a new file.
 * After writing, it will delete the original file.
 * 
 * This program is written in TypeScript and demonstrates basic file operations.
 * 
 * Note: Ensure you have the necessary permissions to read, write, and delete files.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to write contents to a file
function writeFile(filePath: string, data: string): void {
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to delete a file
function deleteFile(filePath: string): void {
    fs.unlinkSync(filePath);
}

// Function to move a file from one location to another
function moveFile(source: string, destination: string): void {
    const data = readFile(source);
    writeFile(destination, data);
    deleteFile(source);
}

// Main function to execute the file move operation
function main(): void {
    const sourceFile = path.join(__dirname, 'source.txt');
    const destinationFile = path.join(__dirname, 'destination.txt');
    
    // Check if source file exists
    if (fs.existsSync(sourceFile)) {
        moveFile(sourceFile, destinationFile);
        console.log('File moved successfully!');
    } else {
        console.log('Source file does not exist.');
    }
}

// Execute the main function
main();

/**
 */