/**
 * Simple File Renamer
 * 
 * This program renames files in a given directory. 
 * It takes a directory path and a new name as input, 
 * then renames all files in the directory to the new name 
 * with an incremented number suffix. 
 * 
 * Usage: node simpleFileRenamer.js <directoryPath> <newName>
 * 
 * This program is written in TypeScript and demonstrates 
 * basic file operations, error handling, and string manipulation.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate new file name with incremented suffix
function generateNewFileName(baseName: string, index: number): string {
    return `${baseName}_${index}`;
}

// Function to rename files in the directory
function renameFilesInDirectory(directoryPath: string, newName: string): void {
    // Read all files in the directory
    const files = fs.readdirSync(directoryPath);
    let index = 1;

    // Loop through each file and rename it
    files.forEach((file) => {
        const oldPath = path.join(directoryPath, file);
        const newPath = path.join(directoryPath, generateNewFileName(newName, index));
        fs.renameSync(oldPath, newPath);
        index++;
    });
}

// Function to validate input arguments
function validateArguments(args: string[]): void {
    if (args.length !== 4) {
        throw new Error('Invalid number of arguments. Usage: node simpleFileRenamer.js <directoryPath> <newName>');
    }
}

// Function to check if the directory exists
function checkDirectoryExists(directoryPath: string): void {
    if (!fs.existsSync(directoryPath)) {
        throw new Error(`Directory does not exist: ${directoryPath}`);
    }
}

// Main function to execute the program
function main(): void {
    const args = process.argv;
    validateArguments(args);

    const directoryPath = args[2];
    const newName = args[3];

    checkDirectoryExists(directoryPath);
    renameFilesInDirectory(directoryPath, newName);
}

// Execute the main function
main();

