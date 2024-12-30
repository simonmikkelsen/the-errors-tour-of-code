/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program is verbose and contains many checks to ensure safety.
 * It is written in TypeScript for type safety and reliability.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to check if a file is deletable
function isFileDeletable(filePath: string): boolean {
    const fileStats = fs.statSync(filePath);
    return fileStats.isFile() && fileStats.size < 1000000; // File must be less than 1MB
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath) && isFileDeletable(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} cannot be deleted.`);
    }
}

// Function to get all files in a directory
function getAllFilesInDirectory(directoryPath: string): string[] {
    return fs.readdirSync(directoryPath).map(file => path.join(directoryPath, file));
}

// Function to delete all files in a directory
function deleteAllFilesInDirectory(directoryPath: string): void {
    const files = getAllFilesInDirectory(directoryPath);
    files.forEach(file => deleteFile(file));
}

// Main function to execute the program
function main(): void {
    const directoryPath = './test_directory';
    deleteAllFilesInDirectory(directoryPath);
}

// Execute the main function
main();

