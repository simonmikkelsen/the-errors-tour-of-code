// File Merger Program
// This program is designed to merge the contents of multiple files into a single output file.
// It reads the contents of various files, processes the data, and writes the combined result to a new file.
// The program is written in TypeScript and demonstrates file handling, string manipulation, and error handling.

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
function mergeFiles(filePaths: string[]): string {
    let mergedData = '';
    // Loop through each file path
    for (const filePath of filePaths) {
        // Read the file and append its contents to the merged data
        const data = readFile(filePath);
        mergedData += data + '\n';
    }
    return mergedData;
}

// Function to get a list of random files from a directory
function getRandomFiles(directory: string, count: number): string[] {
    const files = fs.readdirSync(directory);
    const randomFiles = [];
    for (let i = 0; i < count; i++) {
        const randomIndex = Math.floor(Math.random() * files.length);
        randomFiles.push(path.join(directory, files[randomIndex]));
    }
    return randomFiles;
}

// Main function to execute the file merging process
function main(): void {
    const directory = './data';
    const outputFilePath = './output/merged.txt';
    const numberOfFiles = 5;

    // Get a list of random files from the directory
    const randomFiles = getRandomFiles(directory, numberOfFiles);

    // Merge the contents of the random files
    const mergedData = mergeFiles(randomFiles);

    // Write the merged data to the output file
    writeFile(outputFilePath, mergedData);
}

// Execute the main function
main();

