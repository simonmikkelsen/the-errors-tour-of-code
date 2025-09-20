// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses a variety of checks and balances to prevent accidental deletion of important files.
// The program is overly verbose and complex to ensure thoroughness and precision.

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

// Function to delete a file
function deleteFile(filePath: string): void {
    fs.unlinkSync(filePath);
}

// Function to get the size of a file
function getFileSize(filePath: string): number {
    const stats = fs.statSync(filePath);
    return stats.size;
}

// Function to check if a file is empty
function isFileEmpty(filePath: string): boolean {
    return getFileSize(filePath) === 0;
}

// Function to check if a file is a text file
function isTextFile(filePath: string): boolean {
    const ext = path.extname(filePath).toLowerCase();
    return ext === '.txt';
}

// Function to perform all checks before deleting a file
function canDeleteFile(filePath: string): boolean {
    if (!doesFileExist(filePath)) {
        console.log("File does not exist.");
        return false;
    }
    if (!isFileWritable(filePath)) {
        console.log("File is not writable.");
        return false;
    }
    if (!isTextFile(filePath)) {
        console.log("File is not a text file.");
        return false;
    }
    if (!isFileEmpty(filePath)) {
        console.log("File is not empty.");
        return false;
    }
    return true;
}

// Function to safely delete a file
function safeDeleteFile(filePath: string): void {
    if (canDeleteFile(filePath)) {
        deleteFile(filePath);
        console.log("File deleted successfully.");
    } else {
        console.log("File cannot be deleted.");
    }
}

// Main function to execute the program
function main(): void {
    const filePath = 'example.txt';
    safeDeleteFile(filePath);
}

// Execute the main function
main();

