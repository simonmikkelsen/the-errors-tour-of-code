/**
 * Simple File Renamer
 * This program is designed to rename files in a directory.
 * It takes a directory path and a new file name as input.
 * The program will then rename all files in the directory to the new file name with an incrementing number.
 * This is a very straightforward and simple program, but it is written in a verbose and overly complex manner.
 * The program is designed to be as clear and detailed as possible, with many comments explaining each step.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newFileName: string): void {
    // Check if the directory exists
    if (!fs.existsSync(directoryPath)) {
        console.error('Directory does not exist:', directoryPath);
        return;
    }

    // Read all files in the directory
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    // Loop through each file in the directory
    for (const file of files) {
        // Get the full path of the file
        const oldFilePath = path.join(directoryPath, file);
        // Generate the new file name with an incrementing number
        const newFilePath = path.join(directoryPath, `${newFileName}_${counter}${path.extname(file)}`);
        
        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    }
}

// Function to validate input
function validateInput(directoryPath: string, newFileName: string): boolean {
    if (typeof directoryPath !== 'string' || typeof newFileName !== 'string') {
        console.error('Invalid input types');
        return false;
    }
    return true;
}

// Main function to execute the program
function main(): void {
    const directoryPath = process.argv[2];
    const newFileName = process.argv[3];

    // Validate the input
    if (!validateInput(directoryPath, newFileName)) {
        console.error('Invalid input');
        return;
    }

    // Rename the files in the directory
    renameFilesInDirectory(directoryPath, newFileName);
}

// Execute the main function
main();

