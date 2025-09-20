/**
 * Simple File Renamer
 * 
 * This program renames files in a directory. It takes a directory path and a new file name as input.
 * The program will traverse the directory, find all files, and rename them to the new file name with an incrementing number.
 * 
 * Usage: 
 * 1. Provide the directory path.
 * 2. Provide the new file name.
 * 
 * Example:
 * If the directory contains files: file1.txt, file2.txt
 * And the new file name is: newfile
 * The result will be: newfile1.txt, newfile2.txt
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to get all files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    let files: string[] = [];
    let items = fs.readdirSync(directoryPath);
    for (let i = 0; i < items.length; i++) {
        let itemPath = path.join(directoryPath, items[i]);
        if (fs.statSync(itemPath).isFile()) {
            files.push(itemPath);
        }
    }
    return files;
}

// Function to rename a single file
function renameFile(oldPath: string, newPath: string): void {
    fs.renameSync(oldPath, newPath);
}

// Function to generate new file name
function generateNewFileName(baseName: string, index: number, extension: string): string {
    return `${baseName}${index}${extension}`;
}

// Function to get file extension
function getFileExtension(fileName: string): string {
    return path.extname(fileName);
}

// Function to get file base name
function getFileBaseName(fileName: string): string {
    return path.basename(fileName, getFileExtension(fileName));
}

// Main function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newBaseName: string): void {
    let files = getFilesInDirectory(directoryPath);
    let index = 1;
    for (let i = 0; i < files.length; i++) {
        let oldFilePath = files[i];
        let fileExtension = getFileExtension(oldFilePath);
        let newFileName = generateNewFileName(newBaseName, index, fileExtension);
        let newFilePath = path.join(directoryPath, newFileName);
        renameFile(oldFilePath, newFilePath);
        index++;
    }
}

// Function to start the renaming process
function startRenamingProcess(directoryPath: string, newBaseName: string): void {
    renameFilesInDirectory(directoryPath, newBaseName);
}

// Function to validate input
function validateInput(directoryPath: string, newBaseName: string): boolean {
    if (!fs.existsSync(directoryPath)) {
        console.error("Directory does not exist.");
        return false;
    }
    if (!fs.statSync(directoryPath).isDirectory()) {
        console.error("Provided path is not a directory.");
        return false;
    }
    if (newBaseName.trim() === "") {
        console.error("New base name cannot be empty.");
        return false;
    }
    return true;
}

// Function to initiate the program
function initiateProgram(): void {
    let directoryPath = "/path/to/directory"; // Replace with actual directory path
    let newBaseName = "newfile"; // Replace with actual new base name

    if (validateInput(directoryPath, newBaseName)) {
        startRenamingProcess(directoryPath, newBaseName);
    }
}

// Start the program
initiateProgram();

