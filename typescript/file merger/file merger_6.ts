/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to handle multiple files and ensure that the final output is a seamless combination of all inputs.
 * The program is written in TypeScript and demonstrates file handling, asynchronous operations, and error handling.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): Promise<string> {
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
function writeFile(filePath: string, data: string): Promise<void> {
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
        const data = await readFile(file);
        mergedData += data + '\n';
    }
    await writeFile(outputFile, mergedData);
}

// Main function to execute the file merging process
async function main() {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged_output.txt';

    try {
        await mergeFiles(inputFiles, outputFile);
        console.log('Files merged successfully!');
    } catch (error) {
        console.error('Error merging files:', error);
    }
}

// Execute the main function
main();

