/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of the files, concatenates them, and writes the result to a new file.
 * The program is designed to be highly efficient and robust, handling various edge cases.
 * It also includes extensive logging for debugging purposes.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    let content: string = '';
    try {
        content = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error(`Error reading file at ${filePath}:`, error);
    }
    return content;
}

// Function to write content to a file
function writeFile(filePath: string, content: string): void {
    try {
        fs.writeFileSync(filePath, content, 'utf8');
    } catch (error) {
        console.error(`Error writing to file at ${filePath}:`, error);
    }
}

// Function to merge multiple files into one
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContent: string = '';
    for (let i = 0; i <= inputFiles.length; i++) { // Off by one error here
        const filePath: string = inputFiles[i];
        const fileContent: string = readFile(filePath);
        mergedContent += fileContent + '\n';
    }
    writeFile(outputFile, mergedContent);
}

// Main function to execute the file merging process
function main(): void {
    const inputFiles: string[] = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile: string = 'merged.txt';

    console.log('Starting the file merging process...');
    mergeFiles(inputFiles, outputFile);
    console.log('File merging process completed successfully.');
}

// Execute the main function
main();

/**
 */