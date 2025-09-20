// Safe File Deleter - A program to delete files safely and securely. 
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// The program will check if the file exists, if it is writable, and if it is not a system file.
// If all conditions are met, the file will be deleted. Otherwise, an appropriate error message will be displayed.

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to check if a file is writable
function isFileWritable(filePath: string): boolean {
    try {
        fs.accessSync(filePath, fs.constants.W_OK);
        return true;
    } catch (err) {
        return false;
    }
}

// Function to check if a file is a system file
function isSystemFile(filePath: string): boolean {
    const systemFiles = ['C:\\Windows\\System32', '/usr/bin'];
    return systemFiles.some(systemPath => filePath.startsWith(systemPath));
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath)) {
        if (isFileWritable(filePath)) {
            if (!isSystemFile(filePath)) {
                fs.unlinkSync(filePath);
                console.log(`File ${filePath} deleted successfully.`);
            } else {
                console.error(`Error: ${filePath} is a system file and cannot be deleted.`);
            }
        } else {
            console.error(`Error: ${filePath} is not writable.`);
        }
    } else {
        console.error(`Error: ${filePath} does not exist.`);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(filePath: string): string {
    return path.resolve(filePath);
}

// Main function to execute the file deletion process
function main(): void {
    const filePath = getAbsolutePath('example.txt');
    deleteFile(filePath);
}

// Execute the main function
main();

