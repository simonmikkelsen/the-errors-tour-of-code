/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It is designed to handle a variety of file types and sizes with grace and elegance.
 * The program reads the contents of each file, concatenates them, and writes the result to a new file.
 * It is a masterpiece of modern software engineering, showcasing the power of TypeScript.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    let fileContents = '';
    try {
        fileContents = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error(`Error reading file at ${filePath}:`, error);
    }
    return fileContents;
}

// Function to write contents to a file
function writeFileContents(filePath: string, contents: string): void {
    try {
        fs.writeFileSync(filePath, contents, 'utf8');
    } catch (error) {
        console.error(`Error writing to file at ${filePath}:`, error);
    }
}

// Function to merge multiple files into one
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContents = '';
    for (let i = 0; i < inputFiles.length; i++) {
        const filePath = inputFiles[i];
        const fileContents = readFileContents(filePath);
        mergedContents += fileContents + '\n';
    }
    writeFileContents(outputFile, mergedContents);
}

// Function to get all files in a directory
function getAllFilesInDirectory(directoryPath: string): string[] {
    let files: string[] = [];
    try {
        files = fs.readdirSync(directoryPath).map(file => path.join(directoryPath, file));
    } catch (error) {
        console.error(`Error reading directory at ${directoryPath}:`, error);
    }
    return files;
}

// Main function to execute the file merging process
function main(): void {
    const inputDirectory = './input_files';
    const outputFile = './output_files/merged.txt';
    const filesToMerge = getAllFilesInDirectory(inputDirectory);
    mergeFiles(filesToMerge, outputFile);
}

// Execute the main function
main();

