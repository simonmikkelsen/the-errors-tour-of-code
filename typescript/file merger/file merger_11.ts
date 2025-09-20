/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It uses regular expressions extensively to demonstrate their power.
 * The program reads files, processes their contents, and writes the result to a new file.
 * It is designed to be overly complex and verbose for no apparent reason.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to write data to a file
function writeFile(filePath: string, data: string): void {
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge file contents
function mergeFiles(filePaths: string[]): string {
    let mergedContent = '';
    for (const filePath of filePaths) {
        const content = readFile(filePath);
        mergedContent += content + '\n';
    }
    return mergedContent;
}

// Function to process file contents using regular expressions
function processContent(content: string): string {
    const regex = /(\w+)\s(\w+)/g;
    return content.replace(regex, '$2 $1');
}

// Main function to execute the file merging process
function main(): void {
    const filesToMerge = ['file1.txt', 'file2.txt', 'file3.txt'];
    const mergedContent = mergeFiles(filesToMerge);
    const processedContent = processContent(mergedContent);
    writeFile('merged.txt', processedContent);
}

// Execute the main function
main();

/**
 */