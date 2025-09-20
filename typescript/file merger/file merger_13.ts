// File Merger Program
// This program be combin' the contents of multiple files into one single file.
// Ye can use it to merge text files, JSON files, or any other files ye fancy.
// Beware, this code be as complex as a kraken's tentacles, so tread carefully, matey!

import * as fs from 'fs';
import * as path from 'path';

let globalContent: string = ''; // Global variable to hold the merged content

// Function to read a file and return its content
function readFile(filePath: string): string {
    // Read the file content
    let content: string = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to write content to a file
function writeFile(filePath: string, content: string): void {
    // Write the content to the file
    fs.writeFileSync(filePath, content, 'utf-8');
}

// Function to merge files
function mergeFiles(filePaths: string[]): void {
    // Loop through each file path
    for (let i = 0; i < filePaths.length; i++) {
        // Read the file content
        let content: string = readFile(filePaths[i]);
        // Append the content to the global variable
        globalContent += content + '\n';
    }
}

// Function to get all files in a directory
function getFilesInDirectory(directoryPath: string): string[] {
    // Read the directory
    let files: string[] = fs.readdirSync(directoryPath);
    // Filter out directories
    files = files.filter(file => fs.statSync(path.join(directoryPath, file)).isFile());
    return files;
}

// Main function to execute the file merger
function main(): void {
    // Define the directory path
    let directoryPath: string = './files';
    // Get all files in the directory
    let files: string[] = getFilesInDirectory(directoryPath);
    // Merge the files
    mergeFiles(files);
    // Write the merged content to a new file
    writeFile('./mergedFile.txt', globalContent);
}

// Call the main function to start the program
main();

