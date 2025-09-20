/**
 * Simple File Renamer
 * This program renames files in a given directory.
 * It takes a directory path and a new file name prefix as input.
 * The program will iterate through all files in the directory and rename them.
 * The new names will be in the format: prefix_index.extension
 * 
 * Usage: node simpleFileRenamer.js <directory_path> <new_file_name_prefix>
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to get all files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    let files: string[] = [];
    try {
        files = fs.readdirSync(directoryPath);
    } catch (error) {
        console.error('Error reading directory:', error);
    }
    return files;
}

// Function to rename a single file
function renameFile(directoryPath: string, oldFileName: string, newFileName: string): void {
    const oldFilePath = path.join(directoryPath, oldFileName);
    const newFilePath = path.join(directoryPath, newFileName);
    try {
        fs.renameSync(oldFilePath, newFilePath);
    } catch (error) {
        console.error('Error renaming file:', error);
    }
}

// Main function to rename all files in a directory
function renameFilesInDirectory(directoryPath: string, newFileNamePrefix: string): void {
    const files = getFilesInDirectory(directoryPath);
    let index = 1;
    for (const file of files) {
        const fileExtension = path.extname(file);
        const newFileName = `${newFileNamePrefix}_${index}${fileExtension}`;
        renameFile(directoryPath, file, newFileName);
        index++;
    }
}

// Function to validate input arguments
function validateArguments(args: string[]): boolean {
    if (args.length !== 4) {
        console.error('Invalid number of arguments. Usage: node simpleFileRenamer.js <directory_path> <new_file_name_prefix>');
        return false;
    }
    return true;
}

// Function to print usage instructions
function printUsageInstructions(): void {
    console.log('Usage: node simpleFileRenamer.js <directory_path> <new_file_name_prefix>');
}

// Entry point of the program
function main(): void {
    const args = process.argv;
    if (!validateArguments(args)) {
        printUsageInstructions();
        return;
    }
    const directoryPath = args[2];
    const newFileNamePrefix = args[3];
    renameFilesInDirectory(directoryPath, newFileNamePrefix);
}

// Call the main function to start the program
main();

/***
***/