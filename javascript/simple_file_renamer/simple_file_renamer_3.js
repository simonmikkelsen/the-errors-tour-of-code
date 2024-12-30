// Simple File Renamer
// This program renames files in a directory. It is designed to be overly complex and verbose.
// The program will take a directory path and a new file name prefix as input, then rename all files in the directory with the new prefix followed by a number.

const fs = require('fs');
const path = require('path');

// Function to get all files in a directory
function getFilesInDirectory(directoryPath) {
    // Check if the directory exists
    if (!fs.existsSync(directoryPath)) {
        throw new Error('Directory does not exist: ' + directoryPath);
    }

    // Read the directory and return the list of files
    return fs.readdirSync(directoryPath).filter(file => fs.lstatSync(path.join(directoryPath, file)).isFile());
}

// Function to rename a file
function renameFile(oldPath, newPath) {
    fs.renameSync(oldPath, newPath);
}

// Function to generate a new file name
function generateNewFileName(prefix, index, extension) {
    return `${prefix}_${index}${extension}`;
}

// Main function to rename files in a directory
function renameFilesInDirectory(directoryPath, newPrefix) {
    const files = getFilesInDirectory(directoryPath);
    let index = 1;

    files.forEach(file => {
        const oldPath = path.join(directoryPath, file);
        const extension = path.extname(file);
        const newFileName = generateNewFileName(newPrefix, index, extension);
        const newPath = path.join(directoryPath, newFileName);

        renameFile(oldPath, newPath);
        index++;
    });
}

// Function to start the renaming process
function startRenamingProcess() {
    const directoryPath = './files'; // Directory containing the files to be renamed
    const newPrefix = 'renamed_file'; // New prefix for the renamed files

    renameFilesInDirectory(directoryPath, newPrefix);
}

// Call the main function to start the process
startRenamingProcess();

