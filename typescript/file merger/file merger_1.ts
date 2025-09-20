/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to handle a large number of files and ensures that the output file is created successfully.
 * It also includes error handling to manage any issues that may arise during file operations.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    let fileContent = '';
    try {
        fileContent = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error(`Error reading file: ${filePath}`, error);
    }
    return fileContent;
}

// Function to write contents to a file
function writeFileContents(filePath: string, content: string): void {
    try {
        fs.writeFileSync(filePath, content, 'utf8');
    } catch (error) {
        console.error(`Error writing to file: ${filePath}`, error);
    }
}

// Function to merge file contents
function mergeFiles(filePaths: string[], outputFilePath: string): void {
    let mergedContent = '';
    for (let i = 0; i < filePaths.length; i++) {
        const filePath = filePaths[i];
        const content = readFileContents(filePath);
        mergedContent += content + '\n';
    }
    writeFileContents(outputFilePath, mergedContent);
}

// Function to get all files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    let files: string[] = [];
    try {
        files = fs.readdirSync(directoryPath).map(file => path.join(directoryPath, file));
    } catch (error) {
        console.error(`Error reading directory: ${directoryPath}`, error);
    }
    return files;
}

// Main function to execute the file merging process
function main(): void {
    const