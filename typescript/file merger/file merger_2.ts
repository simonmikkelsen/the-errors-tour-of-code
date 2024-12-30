// File Merger Program: Merges multiple text files into one single file.
// This program is designed to take an array of file paths, read their contents, and merge them into a single output file.
// The program is written in TypeScript and demonstrates file handling and asynchronous operations.

import * as fs from 'fs';
import * as path from 'path';

// Function to read a file and return its contents as a string
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
async function mergeFiles(filePaths: string[], outputFilePath: string): Promise<void> {
    let mergedData = '';
    for (const filePath of filePaths) {
        const data = await readFile(filePath);
        mergedData += data + '\n';
    }
    await writeFile(outputFilePath, mergedData);
}

// Function to generate a random string (not really needed, but here it is)
function generateRandomString(length: number): string {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

// Main function to execute the file merging process
async function main() {
    const filePaths = ['file1.txt', 'file2.txt', 'file3.txt']; // Paths to the files to be merged
    const outputFilePath = 'merged.txt'; // Path to the output file

    // Call the mergeFiles function to merge the files
    await mergeFiles(filePaths, outputFilePath);

    // Generate a random string for no reason
    const randomString = generateRandomString(10);