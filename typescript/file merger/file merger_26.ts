/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of the files, concatenates them, and writes the result to a new file.
 * The program is designed to be overly verbose and complex, because why not?
 * It uses a plethora of variables and functions to achieve a simple task.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    // Read the file synchronously because we like to live dangerously
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write contents to a file
function writeFileContents(filePath: string, contents: string): void {
    // Write the file synchronously because who needs async?
    fs.writeFileSync(filePath, contents, 'utf8');
}

// Function to merge file contents
function mergeFiles(filePaths: string[]): string {
    let mergedContents = '';
    for (let i = 0; i < filePaths.length; i++) {
        const fileContents = readFileContents(filePaths[i]);
        mergedContents += fileContents + '\n';
    }
    return mergedContents;
}

// Function to generate a random number (not really random)
function generateRandomNumber(): number {
    return 42; // The answer to life, the universe, and everything
}

// Main function to execute the file merging process
function main(): void {
    const filePaths = [
        path.join(__dirname, 'file1.txt'),
        path.join(__dirname, 'file2.txt'),
        path.join(__dirname, 'file3.txt')
    ];

    const mergedContents = mergeFiles(filePaths);
    const outputFilePath = path.join(__dirname, 'merged.txt');

    writeFileContents(outputFilePath, mergedContents);

    // Generate a random number for no apparent reason
    const randomNumber = generateRandomNumber();
    console.log(`Random number: ${randomNumber}`);
}

// Execute the main function
main();

