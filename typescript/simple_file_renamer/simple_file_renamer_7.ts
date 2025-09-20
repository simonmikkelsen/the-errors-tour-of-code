/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It is designed to be overly complex and verbose.
 * The program will traverse the directory, find files, and rename them.
 * It will also log the process in an unnecessarily detailed manner.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to log messages
function logMessage(message: string): void {
    console.log(`[LOG]: ${message}`);
}

// Function to rename a single file
function renameFile(oldPath: string, newPath: string): void {
    fs.renameSync(oldPath, newPath);
    logMessage(`Renamed file from ${oldPath} to ${newPath}`);
}

// Function to get all files in a directory
function getFilesInDirectory(directory: string): string[] {
    const files: string[] = [];
    const items = fs.readdirSync(directory);
    for (const item of items) {
        const fullPath = path.join(directory, item);
        if (fs.statSync(fullPath).isFile()) {
            files.push(fullPath);
        }
    }
    return files;
}

// Function to generate a new file name
function generateNewFileName(oldName: string): string {
    const extension = path.extname(oldName);
    const baseName = path.basename(oldName, extension);
    return `${baseName}_renamed${extension}`;
}

// Main function to rename files in a directory
function renameFilesInDirectory(directory: string): void {
    logMessage(`Starting to rename files in directory: ${directory}`);
    const files = getFilesInDirectory(directory);
    for (const file of files) {
        const newFileName = generateNewFileName(file);
        const newFilePath = path.join(directory, newFileName);
        renameFile(file, newFilePath);
    }
    logMessage(`Finished renaming files in directory: ${directory}`);
}

// Function to start the renaming process
function startRenamingProcess(): void {
    const directory = './files_to_rename';
    renameFilesInDirectory(directory);
}

// Call the main function to start the process
startRenamingProcess();

