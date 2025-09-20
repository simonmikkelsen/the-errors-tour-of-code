/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to handle text files and ensures that the final output is a seamless combination of all input files.
 * The program is written in TypeScript for type safety and better error handling.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    // Read the file synchronously
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to write contents to a file
function writeFileContents(filePath: string, data: string): void {
    // Write the data to the file synchronously
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge multiple files into one
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedData = '';

    // Loop through each input file
    for (const file of inputFiles) {
        // Read the contents of the file
        const fileData = readFileContents(file);
        // Append the contents to the merged data
        mergedData += fileData + '\n';
    }

    // Write the merged data to the output file
    writeFileContents(outputFile, mergedData);
}

// Main function to execute the file merging process
function main(): void {
    // Define the input files
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    // Define the output file
    const outputFile = 'merged.txt';

    // Call the mergeFiles function to merge the input files into the output file
    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

