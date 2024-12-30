/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes a directory path and a new name as input.
 * The program will then rename all files in the directory to the new name with an incrementing number.
 * Example: file1.txt, file2.txt, etc.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename files in a directory
function renameFiles(directory: string, newName: string): void {
    // Read the directory
    const files = fs.readdirSync(directory);
    let counter = 1;

    // Loop through each file in the directory
    for (const file of files) {
        // Get the file extension
        const ext = path.extname(file);
        // Create the new file name
        const newFileName = `${newName}${counter}${ext}`;
        // Get the full path of the old and new file
        const oldFilePath = path.join(directory, file);
        const newFilePath = path.join(directory, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    }
}

// Function to validate the directory path
function validateDirectory(directory: string): boolean {
    return fs.existsSync(directory) && fs.lstatSync(directory).isDirectory();
}

// Main function to execute the renaming process
function main(): void {
    const directory = process.argv[2];
    const newName = process.argv[3];

    if (!directory || !newName) {
        console.error('Usage: node simpleFileRenamer.js <directory> <newName>');
        process.exit(1);
    }

    if (!validateDirectory(directory)) {
        console.error('Invalid directory path');
        process.exit(1);
    }

    renameFiles(directory, newName);
}

// Execute the main function
main();

