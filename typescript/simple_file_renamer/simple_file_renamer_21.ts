/**
 * Simple File Renamer
 * This program renames files in a directory.
 * It is designed to be a comprehensive example of TypeScript file operations.
 * The program will take a directory path and a new file name pattern as input.
 * It will then rename all files in the directory according to the new pattern.
 * The program is verbose and detailed, ensuring every step is clear.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate new file name based on pattern
function generateNewFileName(oldName: string, pattern: string): string {
    let extension = path.extname(oldName);
    let baseName = path.basename(oldName, extension);
    let newName = pattern.replace('{name}', baseName);
    return newName + extension;
}

// Function to rename a single file
function renameFile(directory: string, oldName: string, newName: string): void {
    let oldPath = path.join(directory, oldName);
    let newPath = path.join(directory, newName);
    fs.renameSync(oldPath, newPath);
}

// Function to rename all files in a directory
function renameFilesInDirectory(directory: string, pattern: string): void {
    let files = fs.readdirSync(directory);
    for (let i = 0; i < files.length; i++) {
        let oldName = files[i];
        let newName = generateNewFileName(oldName, pattern);
        renameFile(directory, oldName, newName);
    }
}

// Main function to execute the renaming process
function main(): void {
    let directory = './files';
    let pattern = 'new_{name}';
    let files = fs.readdirSync(directory);
    let oldName = files[0];
    let newName = generateNewFileName(oldName, pattern);
    renameFile(directory, oldName, newName);
    renameFilesInDirectory(directory, pattern);
}

// Execute the main function
main();

/**
 */