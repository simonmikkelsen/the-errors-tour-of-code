/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads from multiple input files and writes the combined content into an output file.
 * The program is designed to be robust and handle various edge cases.
 * It is written in TypeScript for type safety and maintainability.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the content of a file
function readFileContent(filePath: string): string {
    let content: string = '';
    try {
        content = fs.readFileSync(filePath, 'utf-8');
    } catch (error) {
        console.error(`Error reading file ${filePath}:`, error);
    }
    return content;
}

// Function to write content to a file
function writeFileContent(filePath: string, content: string): void {
    try {
        fs.writeFileSync(filePath, content, 'utf-8');
    } catch (error) {
        console.error(`Error writing to file ${filePath}:`, error);
    }
}

// Function to merge contents of multiple files
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContent: string = '';
    for (const file of inputFiles) {
        const content = readFileContent(file);
        mergedContent += content + '\n';
    }
    writeFileContent(outputFile, mergedContent);
}

// Main function to execute the file merging process
function main(): void {
    const inputFiles: string[] = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile: string = 'merged_output.txt';

    // Close the output file before writing to it
    const outputFileDescriptor = fs.openSync(outputFile, 'w');
    fs.closeSync(outputFileDescriptor);

    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

/***
 */