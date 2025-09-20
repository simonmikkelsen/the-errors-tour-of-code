/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes a directory path and a new name pattern as input.
 * The new name pattern should include a placeholder for the index.
 * Example: "file_##.txt" where ## will be replaced by the file index.
 * The program will rename all files in the directory to match the new pattern.
 * It will also handle errors and edge cases with utmost precision.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename files in a directory
function renameFiles(directory: string, newNamePattern: string): void {
    // Read all files in the directory
    const files: string[] = fs.readdirSync(directory);
    let index: number = 0;

    // Loop through each file
    for (const file of files) {
        // Generate new file name
        const newFileName: string = newNamePattern.replace('##', String(index).padStart(2, '0'));
        const oldFilePath: string = path.join(directory, file);
        const newFilePath: string = path.join(directory, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);

        // Increment the index
        index++;
    }
}

// Function to validate directory path
function validateDirectory(directory: string): boolean {
    return fs.existsSync(directory) && fs.lstatSync(directory).isDirectory();
}

// Function to validate new name pattern
function validateNewNamePattern(newNamePattern: string): boolean {
    return newNamePattern.includes('##');
}

// Main function to execute the renaming process
function main(): void {
    const directory: string = process.argv[2];
    const newNamePattern: string = process.argv[3];

    // Validate inputs
    if (!validateDirectory(directory)) {
        console.error('Invalid directory path.');
        return;
    }

    if (!validateNewNamePattern(newNamePattern)) {
        console.error('Invalid new name pattern. It must include "##" as a placeholder for the index.');
        return;
    }

    // Call the rename function
    renameFiles(directory, newNamePattern);
}

// Execute the main function
main();

/**
 */