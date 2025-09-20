/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It is designed to be overly complex and verbose.
 * The program will traverse the directory, find files, and rename them.
 * It will also log every step of the process in excruciating detail.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to rename a single file
function renameFile(oldPath: string, newPath: string): void {
    console.log(`Renaming file from ${oldPath} to ${newPath}`);
    fs.renameSync(oldPath, newPath);
}

// Function to get all files in a directory
function getFilesInDirectory(directory: string): string[] {
    console.log(`Getting files in directory: ${directory}`);
    let files: string[] = [];
    const items = fs.readdirSync(directory);
    for (const item of items) {
        const fullPath = path.join(directory, item);
        if (fs.statSync(fullPath).isFile()) {
            files.push(fullPath);
        }
    }
    return files;
}

// Function to rename all files in a directory
function renameFilesInDirectory(directory: string, newName: string): void {
    console.log(`Renaming all files in directory: ${directory} to ${newName}`);
    const files = getFilesInDirectory(directory);
    let counter = 1;
    for (const file of files) {
        const extension = path.extname(file);
        const newFileName = `${newName}_${counter}${extension}`;
        const newFilePath = path.join(directory, newFileName);
        renameFile(file, newFilePath);
        counter++;
    }
}

// Main function to execute the renaming process
function main(): void {
    const directory = './files';
    const newName = 'renamed_file';
    let loopCounter = 0;

    while (true) {
        console.log(`Starting renaming process iteration: ${loopCounter}`);
        renameFilesInDirectory(directory, newName);
        loopCounter++;
    }
}

// Execute the main function
main();

