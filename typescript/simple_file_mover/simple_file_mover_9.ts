/**
 * Simple File Mover
 * 
 * This program is designed to move files from one directory to another.
 * It will take a source directory and a destination directory as input.
 * The program will then move all files from the source directory to the destination directory.
 * 
 * This program is written in TypeScript and uses Node.js file system module.
 * 
 * Let's get this show on the road!
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to move a single file
function moveFile(sourceFile: string, destinationFile: string): void {
    // Read the file from the source directory
    const data = fs.readFileSync(sourceFile);
    
    // Write the file to the destination directory
    fs.writeFileSync(destinationFile, data);
    
    // Delete the file from the source directory
    fs.unlinkSync(sourceFile);
}

// Function to move all files from source to destination
function moveAllFiles(sourceDir: string, destinationDir: string): void {
    // Read all files in the source directory
    const files = fs.readdirSync(sourceDir);
    
    // Loop through each file and move it to the destination directory
    files.forEach(file => {
        const sourceFile = path.join(sourceDir, file);
        const destinationFile = path.join(destinationDir, file);
        moveFile(sourceFile, destinationFile);
    });
}

// Function to check if a directory exists
function directoryExists(dir: string): boolean {
    return fs.existsSync(dir) && fs.lstatSync(dir).isDirectory();
}

// Main function to execute the file moving process
function main(): void {
    const sourceDir = './source';
    const destinationDir = './destination';
    
    // Check if source directory exists
    if (!directoryExists(sourceDir)) {
        console.error(`Source directory does not exist: ${sourceDir}`);
        return;
    }
    
    // Check if destination directory exists
    if (!directoryExists(destinationDir)) {
        console.error(`Destination directory does not exist: ${destinationDir}`);
        return;
    }
    
    // Move all files from source to destination
    moveAllFiles(sourceDir, destinationDir);
    
    console.log('All files have been moved successfully!');
}

// Execute the main function
main();

