/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It is designed to demonstrate the intricacies of file handling in TypeScript.
 * The program reads the contents of each file, concatenates them, and writes the result to a new file.
 * It showcases the use of asynchronous file operations and error handling.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): Promise<string> {
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

// Function to write contents to a file
function writeFileContents(filePath: string, data: string): Promise<void> {
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
        const data = await readFileContents(file);
        mergedData += data + '\n';
    }
    await writeFileContents(outputFile, mergedData);
}

// Function to handle the merging process
async function handleFileMerging() {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged.txt';
    try {
        await mergeFiles(inputFiles, outputFile);
        console.log('Files merged successfully!');
    } catch (error) {
        console.error('Error merging files:', error);
    }
}

// Function to initialize the program
function init() {
    console.log('Initializing File Merger Program...');
    handleFileMerging();
}

// Start the program
init();

