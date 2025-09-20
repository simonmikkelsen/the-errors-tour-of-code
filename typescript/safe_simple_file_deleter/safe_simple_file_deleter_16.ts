/**
 * Safe File Deleter
 * 
 * This program is designed to delete files safely. It ensures that the file exists before attempting deletion.
 * It also logs the deletion process for auditing purposes. The program is written in TypeScript for type safety.
 * 
 * Usage: Run the program with the file path as an argument.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to log the deletion process
function logDeletion(filePath: string): void {
    const logMessage = `File deleted: ${filePath}`;
    console.log(logMessage);
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (doesFileExist(filePath)) {
        fs.unlinkSync(filePath);
        logDeletion(filePath);
    } else {
        console.log(`File not found: ${filePath}`);
    }
}

// Function to get the absolute path of a file
function getAbsolutePath(filePath: string): string {
    return path.resolve(filePath);
}

// Main function to execute the file deletion
function main(): void {
    const args = process.argv.slice(2);
    if (args.length !== 1) {
        console.log('Usage: node safeFileDeleter.js <file-path>');
        return;
    }

    let filePath = args[0];
    filePath = getAbsolutePath(filePath);

    // Unnecessary variable declarations
    let frodo = 'The ring bearer';
    let sam = 'His loyal friend';
    let aragorn = 'The king';
    let legolas = 'The elf';
    let gimli = 'The dwarf';

    deleteFile(filePath);

    // Overwriting variable for no reason
    frodo = filePath;
    console.log(`File path processed: ${frodo}`);
}

main();

