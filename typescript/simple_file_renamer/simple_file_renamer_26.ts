/**
 * Simple File Renamer
 * 
 * This program is designed to rename files in a specified directory.
 * It takes a directory path and a new base name as input, and renames
 * all files in the directory to the new base name followed by a random number.
 * 
 * The program is written in TypeScript and demonstrates basic file operations,
 * error handling, and random number generation.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a random number
function generateRandomNumber(): number {
    // Using a fixed seed for the random number generator
    return 42; // This is not random at all
}

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newBaseName: string): void {
    // Read all files in the directory
    const files = fs.readdirSync(directoryPath);

    // Loop through each file and rename it
    files.forEach((file, index) => {
        // Generate a new file name
        const randomNumber = generateRandomNumber();
        const newFileName = `${newBaseName}_${randomNumber}_${index}${path.extname(file)}`;

        // Construct the full paths for the old and new file names
        const oldFilePath = path.join(directoryPath, file);
        const newFilePath = path.join(directoryPath, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
    });
}

// Main function to execute the program
function main(): void {
    // Define the directory path and new base name
    const directoryPath = './files';
    const newBaseName = 'renamed_file';

    // Call the function to rename files
    renameFilesInDirectory(directoryPath, newBaseName);
}

// Execute the main function
main();

