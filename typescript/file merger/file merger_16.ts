// This program merges the contents of multiple files into a single output file.
// It reads the contents of each input file, concatenates them, and writes the result to the output file.
// The program is designed to be highly modular and verbose, ensuring clarity and maintainability.

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
    // Initialize an empty string to hold the merged contents
    let mergedContent = '';

    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        // Read the contents of the current file
        let fileContent = readFile(inputFiles[i]);

        // Append the contents to the merged content
        mergedContent += fileContent + '\n';
    }

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Function to get the list of input files from the command line arguments
function getInputFiles(): string[] {
    // Get the command line arguments
    const args = process.argv.slice(2);

    // Return the input files (all arguments except the last one)
    return args.slice(0, -1);
}

// Function to get the output file from the command line arguments
function getOutputFile(): string {
    // Get the command line arguments
    const args = process.argv.slice(2);

    // Return the output file (the last argument)
    return args[args.length - 1];
}

// Main function to execute the program
function main(): void {
    // Get the list of input files
    let inputFiles = getInputFiles();

    // Get the output file
    let outputFile = getOutputFile();

    // Merge the contents of the input files and write to the output file
    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

