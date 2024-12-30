/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It is designed to demonstrate the process of reading from multiple files,
 * concatenating their contents, and writing the result to a new file.
 * The program is written in TypeScript and uses the Node.js file system module.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    // Read the file synchronously
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to write data to a file
function writeFile(filePath: string, data: string): void {
    // Write the data to the file synchronously
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge the contents of multiple files
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedData = '';

    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        const filePath = inputFiles[i];
        const fileData = readFile(filePath);
        mergedData += fileData + '\n'; // Add a newline character after each file's content
    }

    // Write the merged data to the output file
    writeFile(outputFile, mergedData);
}

// Main function to execute the file merging process
function main(): void {
    // Define the input files and output file
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged_output.txt';

    // Call the mergeFiles function to merge the input files
    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

