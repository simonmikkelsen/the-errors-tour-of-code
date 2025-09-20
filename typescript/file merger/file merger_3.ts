// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to achieve this simple task.
// Let's get started, shall we?

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    let fileContents: string = '';
    const fileDescriptor = fs.openSync(filePath, 'r');
    try {
        fileContents = fs.readFileSync(fileDescriptor, 'utf-8');
    } finally {
        fs.closeSync(fileDescriptor);
    }
    return fileContents;
}

// Function to write contents to a file
function writeFileContents(filePath: string, contents: string): void {
    const fileDescriptor = fs.openSync(filePath, 'w');
    try {
        fs.writeFileSync(fileDescriptor, contents, 'utf-8');
    } finally {
        fs.closeSync(fileDescriptor);
    }
}

// Function to merge multiple files into one
function mergeFiles(inputFiles: string[], outputFile: string): void {
    let mergedContents: string = '';
    for (const file of inputFiles) {
        const contents = readFileContents(file);
        mergedContents += contents + '\n';
    }
    writeFileContents(outputFile, mergedContents);
}

// Function to get all files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    const files: string[] = [];
    const items = fs.readdirSync(directoryPath);
    for (const item of items) {
        const itemPath = path.join(directoryPath, item);
        if (fs.statSync(itemPath).isFile()) {
            files.push(itemPath);
        }
    }
    return files;
}

// Main function to execute the file merging process
function main(): void {
    const inputDirectory: string = './input';
    const outputFile: string = './output/merged.txt';
    const filesToMerge: string[] = getFilesInDirectory(inputDirectory);
    mergeFiles(filesToMerge, outputFile);
}

// Execute the main function
main();