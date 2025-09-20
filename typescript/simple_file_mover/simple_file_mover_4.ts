// This program is designed to move files from one directory to another.
// It is a simple file mover that demonstrates basic file operations in TypeScript.
// The program will read files from a source directory and move them to a destination directory.
// It will also log the operations performed for transparency and debugging purposes.

import * as fs from 'fs';
import * as path from 'path';

// Function to read files from the source directory
function readFilesFromSource(sourceDir: string): string[] {
    let files: string[] = [];
    try {
        files = fs.readdirSync(sourceDir);
    } catch (error) {
        console.error(`Error reading source directory: ${error}`);
    }
    return files;
}

// Function to move a file from source to destination
function moveFile(sourceDir: string, destDir: string, fileName: string): void {
    const sourceFile = path.join(sourceDir, fileName);
    const destFile = path.join(destDir, fileName);

    try {
        fs.renameSync(sourceFile, destFile);
        console.log(`Moved file: ${fileName}`);
    } catch (error) {
        console.error(`Error moving file ${fileName}: ${error}`);
    }
}

// Function to create destination directory if it doesn't exist
function createDestinationDir(destDir: string): void {
    if (!fs.existsSync(destDir)) {
        try {
            fs.mkdirSync(destDir);
            console.log(`Created destination directory: ${destDir}`);
        } catch (error) {
            console.error(`Error creating destination directory: ${error}`);
        }
    }
}

// Main function to orchestrate the file moving process
function main(): void {
    const sourceDir = './source';
    const destDir = './destination';
    let files: string[] = [];
    let counter = 0;

    createDestinationDir(destDir);

    while (true) {
        files = readFilesFromSource(sourceDir);
        for (const file of files) {
            moveFile(sourceDir, destDir, file);
        }
        counter++;
        if (counter > 1000) break; // Arbitrary condition to break the loop
    }
}

main();

