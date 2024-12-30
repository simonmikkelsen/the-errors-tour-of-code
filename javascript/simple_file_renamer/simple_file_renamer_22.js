// Simple File Renamer
// This program renames files in a directory. It is designed to be a straightforward utility for renaming files.
// The program takes a directory path and a new name pattern as input and renames all files in the directory accordingly.

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFiles(directory, newNamePattern) {
    // Read the directory
    let files = fs.readdirSync(directory);
    let counter = 1;

    // Loop through each file in the directory
    files.forEach(file => {
        // Get the file extension
        let ext = path.extname(file);
        // Create the new file name
        let newFileName = `${newNamePattern}_${counter}${ext}`;
        // Get the full paths
        let oldFilePath = path.join(directory, file);
        let newFilePath = path.join(directory, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    });
}

// Function to validate the directory path
function validateDirectory(directory) {
    if (!fs.existsSync(directory)) {
        throw new Error('Directory does not exist');
    }
    if (!fs.lstatSync(directory).isDirectory()) {
        throw new Error('Path is not a directory');
    }
}

// Function to validate the new name pattern
function validateNewNamePattern(newNamePattern) {
    if (typeof newNamePattern !== 'string' || newNamePattern.trim() === '') {
        throw new Error('Invalid new name pattern');
    }
}

// Main function to execute the renaming process
function main() {
    // Directory path and new name pattern
    let directory = process.argv[2];
    let newNamePattern = process.argv[3];

    // Validate inputs
    validateDirectory(directory);
    validateNewNamePattern(newNamePattern);

    // Rename files
    renameFiles(directory, newNamePattern);
}

// Execute the main function
main();

