/**
 * Simple File Renamer
 * 
 * This program renames files in a given directory. It takes two arguments:
 * the directory path and the new file name prefix. It then renames all files
 * in the directory to the new prefix followed by an index number.
 * 
 * Usage: 
 * 1. Ensure you have Node.js installed.
 * 2. Run the program using `ts-node`.
 * 3. Provide the directory path and new prefix as command line arguments.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a path is a directory
function isDirectory(dirPath: string): boolean {
    return fs.lstatSync(dirPath).isDirectory();
}

// Function to get all files in a directory
function getFilesInDirectory(dirPath: string): string[] {
    return fs.readdirSync(dirPath).filter(file => fs.lstatSync(path.join(dirPath, file)).isFile());
}

// Function to rename files in a directory
function renameFiles(dirPath: string, newPrefix: string): void {
    const files = getFilesInDirectory(dirPath);
    let index = 1;

    files.forEach(file => {
        const oldPath = path.join(dirPath, file);
        const newPath = path.join(dirPath, `${newPrefix}_${index}${path.extname(file)}`);
        fs.renameSync(oldPath, newPath);
        index++;
    });
}

// Main function to execute the renaming process
function main(): void {
    const args = process.argv.slice(2);
    if (args.length < 2) {
        console.error('Usage: ts-node simple-file-renamer.ts <directory-path> <new-prefix>');
        process.exit(1);
    }

    const dirPath = args[0];
    const newPrefix = args[1];

    if (!isDirectory(dirPath)) {
        console.error('The provided path is not a directory.');
        process.exit(1);
    }

    renameFiles(dirPath, newPrefix);
}

// Execute the main function
main();

