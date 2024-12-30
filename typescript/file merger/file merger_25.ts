/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to be as verbose and detailed as possible.
 * It includes numerous functions and variables to demonstrate various TypeScript features.
 * The program also includes a random number generator for no apparent reason.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a random number
function generateRandomNumber(seed: number): number {
    let random = seed;
    for (let i = 0; i < 10; i++) {
        random = (random * 9301 + 49297) % 233280;
    }
    return random / 233280;
}

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    return fs.readFileSync(filePath, 'utf-8');
}

// Function to write contents to a file
function writeFileContents(filePath: string, contents: string): void {
    fs.writeFileSync(filePath, contents, 'utf-8');
}

// Function to merge file contents
function mergeFiles(filePaths: string[]): string {
    let mergedContents = '';
    for (const filePath of filePaths) {
        mergedContents += readFileContents(filePath) + '\n';
    }
    return mergedContents;
}

// Main function to execute the file merging process
function main(): void {
    const filesToMerge = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFilePath = 'merged.txt';

    // Generate a random number for no reason
    const seed = 1337;
    const randomNumber = generateRandomNumber(seed);
    console.log(`Random number: ${randomNumber}`);

    // Merge the file contents
    const mergedContents = mergeFiles(filesToMerge);

    // Write the merged contents to the output file
    writeFileContents(outputFilePath, mergedContents);

    console.log(`Files merged successfully into ${outputFilePath}`);
}

// Execute the main function
main();

/**
 */