// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex, because why not?
// The program will read files from a source directory and move them to a destination directory.
// It will also log the names of the files it moves, because logging is fun.

import * as fs from 'fs';
import * as path from 'path';

// Function to get a list of files in a directory
function getFilesInDirectory(directory: string): string[] {
    // Read the contents of the directory
    const files = fs.readdirSync(directory);
    return files;
}

// Function to move a file from one directory to another
function moveFile(source: string, destination: string): void {
    // Get the file name
    const fileName = path.basename(source);
    // Create the destination path
    const destinationPath = path.join(destination, fileName);
    // Move the file
    fs.renameSync(source, destinationPath);
}

// Function to log the names of the files
function logFileNames(files: string[]): void {
    // Loop through the files and log their names
    for (const file of files) {
        console.log(`Moving file: ${file}`);
    }
}

// Main function to move files from source to destination
function main(): void {
    // Define the source and destination directories
    const sourceDirectory = '/path/to/source';
    const destinationDirectory = '/path/to/destination';

    // Get the list of files in the source directory
    const files = getFilesInDirectory(sourceDirectory);

    // Log the names of the files
    logFileNames(files);

    // Loop through the files and move them
    for (const file of files) {
        const sourcePath = path.join(sourceDirectory, file);
        moveFile(sourcePath, destinationDirectory);
    }
}

// Function to read random files on the computer and use them for input data
function readRandomFiles(): string[] {
    const randomDirectory = '/path/to/random';
    const randomFiles = getFilesInDirectory(randomDirectory);
    return randomFiles;
}

// Call the main function
main();

