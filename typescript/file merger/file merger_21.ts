/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to be as verbose and detailed as possible.
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
function mergeFiles(filePaths: string[], outputFilePath: string): void {
    // Initialize an empty string to hold the merged contents
    let mergedData = '';

    // Loop through each file path
    for (let i = 0; i < filePaths.length; i++) {
        // Read the contents of the file
        const fileData = readFile(filePaths[i]);

        // Append the file data to the merged data
        mergedData += fileData + '\n';
    }

    // Write the merged data to the output file
    writeFile(outputFilePath, mergedData);
}

// Function to get the list of files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    // Read the contents of the directory
    const files = fs.readdirSync(directoryPath);

    // Filter out directories and return only file paths
    return files.filter(file => fs.statSync(path.join(directoryPath, file)).isFile());
}

// Main function to execute the file merger
function main(): void {
    // Define the directory containing the files to merge
    const directoryPath = './files';

    // Get the list of files in the directory
    const files = getFilesInDirectory(directoryPath);

    // Define the output file path
    const outputFilePath = './merged_output.txt';

    // Merge the files
    mergeFiles(files, outputFilePath);
}

// Execute the main function
main();

/**
 */