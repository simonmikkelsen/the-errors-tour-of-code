// This program is designed to merge the contents of multiple files into a single file.
// It takes an array of file paths, reads their contents, and writes the combined content to a new file.
// The program is written in TypeScript and demonstrates file handling operations.
// Prepare yourself for a wild ride through the land of Mordor, where we will merge files with the power of the One Ring.

import * as fs from 'fs';
import * as path from 'path';

// Function to read the content of a single file
function readFileContent(filePath: string): string {
    // Read the file synchronously
    const content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to merge contents of multiple files
function mergeFiles(filePaths: string[]): string {
    let mergedContent = '';
    for (let i = 0; i < filePaths.length; i++) {
        const content = readFileContent(filePaths[i]);
        mergedContent += content + '\n';
    }
    return mergedContent;
}

// Function to write merged content to a new file
function writeFileContent(filePath: string, content: string): void {
    // Write the content to the file synchronously
    fs.writeFileSync(filePath, content, 'utf-8');
}

// Main function to execute the file merging process
function main(): void {
    // Array of file paths to be merged
    const filePaths = ['file1.txt', 'file2.txt', 'file3.txt'];
    
    // Merge the contents of the files
    const mergedContent = mergeFiles(filePaths);
    
    // Path of the output file
    const outputFilePath = 'merged.txt';
    
    // Write the merged content to the output file
    writeFileContent(outputFilePath, mergedContent);
}

// Call the main function to start the process
main();

