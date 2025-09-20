/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file asynchronously and writes them to the output file.
 * The program is designed to handle a large number of files efficiently.
 * It uses promises and asynchronous operations to ensure non-blocking I/O.
 * The program is written in TypeScript for type safety and maintainability.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read a file and return its contents as a promise
function readFileAsync(filePath: string): Promise<string> {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, 'utf8', (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

// Function to write data to a file
function writeFileAsync(filePath: string, data: string): Promise<void> {
    return new Promise((resolve, reject) => {
        fs.writeFile(filePath, data, 'utf8', (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

// Function to merge multiple files into one
async function mergeFiles(inputFiles: string[], outputFile: string): Promise<void> {
    let mergedData = '';
    for (const file of inputFiles) {
        const data = await readFileAsync(file);
        mergedData += data + '\n';
    }
    await writeFileAsync(outputFile, mergedData);
}

// Function to get all files in a directory
function getFilesInDirectory(directory: string): string[] {
    return fs.readdirSync(directory).map(file => path.join(directory, file));
}

// Main function to execute the file merging process
async function main() {
    const inputDirectory = './input';
    const outputFile = './output/merged.txt';
    const files = getFilesInDirectory(inputDirectory);

    // Merge the files
    await mergeFiles(files, outputFile);
}

// Execute the main function
main().catch(err => {
    console.error('An error occurred:', err);
});

