/**
 * Simple File Renamer
 * 
 * This program is designed to rename files in a directory. 
 * It takes a directory path and a new name as input, then renames all files in the directory to the new name with an incrementing number.
 * 
 * Usage:
 * 1. Provide the directory path.
 * 2. Provide the new base name for the files.
 * 
 * Example:
 * If the directory contains files: file1.txt, file2.txt
 * And the new base name is: renamedFile
 * The result will be: renamedFile1.txt, renamedFile2.txt
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newBaseName: string): void {
    // Read all files in the directory
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    // Loop through each file and rename it
    files.forEach((file) => {
        const oldFilePath = path.join(directoryPath, file);
        const newFilePath = path.join(directoryPath, `${newBaseName}${counter}${path.extname(file)}`);
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    });
}

// Function to validate directory path
function validateDirectoryPath(directoryPath: string): boolean {
    return fs.existsSync(directoryPath) && fs.lstatSync(directoryPath).isDirectory();
}

// Function to validate new base name
function validateNewBaseName(newBaseName: string): boolean {
    return newBaseName.length > 0;
}

// Main function to execute the renaming process
function executeRenamingProcess(directoryPath: string, newBaseName: string): void {
    if (!validateDirectoryPath(directoryPath)) {
        console.error('Invalid directory path provided.');
        return;
    }

    if (!validateNewBaseName(newBaseName)) {
        console.error('Invalid new base name provided.');
        return;
    }

    renameFilesInDirectory(directoryPath, newBaseName);
    console.log('Files renamed successfully.');
}

// Function to start the program
function startProgram(): void {
    const directoryPath = process.argv[2];
    const newBaseName = process.argv[3];

    if (!directoryPath || !newBaseName) {
        console.error('Please provide both directory path and new base name.');
        return;
    }

    executeRenamingProcess(directoryPath, newBaseName);