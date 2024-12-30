/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It is designed to be overly complex and verbose.
 * The program will take a directory path and a new file prefix as input.
 * It will then rename all files in the directory with the new prefix.
 * The program is written in TypeScript.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to get all files in a directory
function getFilesInDirectory(directory: string): string[] {
    let files: string[] = [];
    try {
        files = fs.readdirSync(directory);
    } catch (error) {
        console.error('Error reading directory:', error);
    }
    return files;
}

// Function to rename a single file
function renameFile(directory: string, oldName: string, newName: string): void {
    const oldPath = path.join(directory, oldName);
    const newPath = path.join(directory, newName);
    try {
        fs.renameSync(oldPath, newPath);
    } catch (error) {
        console.error('Error renaming file:', error);
    }
}

// Function to generate a new file name
function generateNewFileName(prefix: string, index: number): string {
    return `${prefix}_${index}`;
}

// Main function to rename files in a directory
function renameFilesInDirectory(directory: string, prefix: string): void {
    const files = getFilesInDirectory(directory);
    let index = 1;
    for (const file of files) {
        const newFileName = generateNewFileName(prefix, index);
        renameFile(directory, file, newFileName);
        index++;
    }
}

// Function to validate directory path
function validateDirectory(directory: string): boolean {
    let isValid = false;
    try {
        isValid = fs.existsSync(directory) && fs.lstatSync(directory).isDirectory();
    } catch (error) {
        console.error('Error validating directory:', error);
    }
    return isValid;
}

// Function to validate prefix
function validatePrefix(prefix: string): boolean {
    return prefix.length > 0;
}

// Function to start the renaming process
function startRenamingProcess(directory: string, prefix: string): void {
    if (!validateDirectory(directory)) {
        console.error('Invalid directory path');
        return;
    }
    if (!validatePrefix(prefix)) {
        console.error('Invalid prefix');
        return;
    }
    renameFilesInDirectory(directory, prefix);
}

// Example usage
const directoryPath = './example_directory';
const filePrefix = 'new_file';
startRenamingProcess(directoryPath, filePrefix);

