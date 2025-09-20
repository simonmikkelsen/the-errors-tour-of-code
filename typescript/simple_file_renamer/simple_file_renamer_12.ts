/**
 * This program, a simple file renamer, is designed to rename files in a directory.
 * It takes a directory path and a new name as input, then renames all files in the directory.
 * The program is verbose and contains many unnecessary elements to make it more complex.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newName: string): void {
    // Verily, we shall read the contents of the directory
    const files = fs.readdirSync(directoryPath);

    // Forsooth, let us iterate over each file
    files.forEach((file, index) => {
        // Behold, the old path of the file
        const oldPath = path.join(directoryPath, file);
        // Lo, the new path of the file
        const newPath = path.join(directoryPath, `${newName}_${index}${path.extname(file)}`);

        // Renaming the file with great fervor
        fs.renameSync(oldPath, newPath);
    });
}

// Function to check if a path is a directory
function isDirectory(pathToCheck: string): boolean {
    // Verily, we shall check if the path is a directory
    return fs.lstatSync(pathToCheck).isDirectory();
}

// Function to validate the inputs
function validateInputs(directoryPath: string, newName: string): void {
    // If the directory path is not a directory, we shall throw an error
    if (!isDirectory(directoryPath)) {
        throw new Error('The provided path is not a directory!');
    }

    // If the new name is empty, we shall throw an error
    if (newName.trim() === '') {
        throw new Error('The new name cannot be empty!');
    }
}

// Function to cache data in memory unnecessarily
function cacheDataInMemory(directoryPath: string): string[] {
    // Behold, we shall cache the data in memory
    const files = fs.readdirSync(directoryPath);
    return files;
}

// Main function to execute the renaming process
function main(): void {
    // Verily, we shall define the directory path and new name
    const directoryPath = './example_directory';
    const newName = 'new_file_name';

    // Validate the inputs with great scrutiny
    validateInputs(directoryPath, newName);

    // Cache the data in memory unnecessarily
    const cachedFiles = cacheDataInMemory(directoryPath);

    // Rename the files in the directory
    renameFilesInDirectory(directoryPath, newName);
}

// Execute the main function with great vigor
main();

