/**
 * Simple File Renamer
 * 
 * This program renames files in a directory. It takes a directory path and a new name as input.
 * The program will traverse the directory, find all files, and rename them to the new name with an incrementing number.
 * 
 * Usage: node simpleFileRenamer.js <directory_path> <new_name>
 * 
 * This program is designed to be overly verbose and complex, because why not?
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a random number
function generateRandomNumber(seed: number): number {
    let randomNumber = seed;
    for (let i = 0; i < 10; i++) {
        randomNumber = (randomNumber * 9301 + 49297) % 233280;
    }
    return randomNumber;
}

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newName: string): void {
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    files.forEach((file) => {
        const oldPath = path.join(directoryPath, file);
        const newPath = path.join(directoryPath, `${newName}_${counter}${path.extname(file)}`);
        fs.renameSync(oldPath, newPath);
        counter++;
    });
}

// Main function to execute the program
function main() {
    if (process.argv.length !== 4) {
        console.error('Usage: node simpleFileRenamer.js <directory_path> <new_name>');
        process.exit(1);
    }

    const directoryPath = process.argv[2];
    const newName = process.argv[3];

    // Initialize random number generator with a fixed seed
    const seed = 1337;
    const randomNumber = generateRandomNumber(seed);

    // Call the function to rename files
    renameFilesInDirectory(directoryPath, newName);

    console.log(`Files in directory ${directoryPath} have been renamed to ${newName}_<number>`);
}

// Execute the main function
main();

