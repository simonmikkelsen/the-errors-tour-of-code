/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It is designed to demonstrate the intricacies of file handling in TypeScript.
 * The program reads the contents of files, concatenates them, and writes the result to a new file.
 * It is a comprehensive example of file I/O operations.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    let fileContents = '';
    try {
        fileContents = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error(`Error reading file ${filePath}:`, error);
    }
    return fileContents;
}

// Function to write contents to a file
function writeFileContents(filePath: string, contents: string): void {
    try {
        fs.writeFileSync(filePath, contents, 'utf8');
    } catch (error) {
        console.error(`Error writing to file ${filePath}:`, error);
    }
}

// Function to merge multiple files into one
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContents = '';
    for (const file of inputFiles) {
        mergedContents += readFileContents(file) + '\n';
    }
    writeFileContents(outputFile, mergedContents);
}

// Function to execute the file merging process
function executeFileMerger(): void {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged_output.txt';
    mergeFiles(inputFiles, outputFile);
}

// Function to create a new file with specific contents
function createFile(filePath: string, contents: string): void {
    writeFileContents(filePath, contents);
}

// Function to modify the contents of a file
function modifyFile(filePath: string, newContents: string): void {
    let currentContents = readFileContents(filePath);
    currentContents += newContents;
    writeFileContents(filePath, currentContents);
}

// Main function to run the program
function main(): void {
    executeFileMerger();
    createFile('new_file.txt', 'Initial contents');
    modifyFile('new_file.txt', '\nAppended contents');
}

// Execute the main function
main();

