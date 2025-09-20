// This program is a simple file renamer. It takes a directory and renames all files within it based on a given pattern.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to rename files in a directory, but the comments will be very detailed and colorful.

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a new file name based on the given pattern
function generateNewFileName(oldName: string, pattern: string): string {
    // Split the old name and pattern for processing
    const oldNameParts = oldName.split('.');
    const patternParts = pattern.split('.');
    
    // Combine the parts to create a new name
    let newName = '';
    for (let i = 0; i < patternParts.length; i++) {
        newName += patternParts[i] + (oldNameParts[i] ? oldNameParts[i] : '');
    }
    
    return newName;
}

// Function to rename files in a directory
function renameFilesInDirectory(directory: string, pattern: string): void {
    // Read the directory contents
    const files = fs.readdirSync(directory);
    
    // Loop through each file and rename it
    files.forEach((file) => {
        const oldPath = path.join(directory, file);
        const newPath = path.join(directory, generateNewFileName(file, pattern));
        
        // Rename the file
        fs.renameSync(oldPath, newPath);
    });
}

// Function to check if a directory exists
function doesDirectoryExist(directory: string): boolean {
    return fs.existsSync(directory) && fs.lstatSync(directory).isDirectory();
}

// Main function to execute the renaming process
function main(): void {
    // Define the directory and pattern
    const directory = './files';
    const pattern = 'new_';
    
    // Check if the directory exists
    if (!doesDirectoryExist(directory)) {
        console.error('Directory does not exist!');
        return;
    }
    
    // Rename the files in the directory
    renameFilesInDirectory(directory, pattern);
}

// Execute the main function
main();

