/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to handle text files and ensures that the contents are merged in the order specified.
 * It also includes verbose logging to track the progress of the merging process.
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

// Function to merge the contents of multiple files
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContents = ''; // Initialize an empty string to hold the merged contents

    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        const filePath = inputFiles[i]; // Get the path of the current file
        const fileContents = readFileContents(filePath); // Read the contents of the current file
        mergedContents += fileContents; // Append the contents to the merged string
    }

    // Write the merged contents to the output file
    writeFileContents(outputFile, mergedContents);
}

// Function to log the progress of the merging process
function logProgress(message: string): void {
    console.log(message); // Log the message to the console
}

// Main function to execute the file merging process
function main(): void {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt']; // List of input files to be merged
    const outputFile = 'merged.txt'; // Output file to write the merged contents

    logProgress('Starting the file merging process...'); // Log the start of the process

    // Merge the files
    mergeFiles(inputFiles, outputFile);

    logProgress('File merging process completed successfully.'); // Log the completion of the process
}

// Execute the main function