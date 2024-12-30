// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to rename files in a directory to a new format specified by the user.

const fs = require('fs');
const path = require('path');

// Function to get all files in a directory
function getFilesInDirectory(directory) {
    let files = [];
    let items = fs.readdirSync(directory);
    for (let i = 0; i < items.length; i++) {
        let fullPath = path.join(directory, items[i]);
        if (fs.statSync(fullPath).isFile()) {
            files.push(fullPath);
        }
    }
    return files;
}

// Function to rename a single file
function renameFile(oldPath, newPath) {
    fs.renameSync(oldPath, newPath);
}

// Function to generate a new file name based on the old name
function generateNewFileName(oldName, newFormat) {
    let extension = path.extname(oldName);
    let baseName = path.basename(oldName, extension);
    return newFormat.replace('%name%', baseName) + extension;
}

// Main function to rename all files in a directory
function renameFilesInDirectory(directory, newFormat) {
    let files = getFilesInDirectory(directory);
    for (let i = 0; i < files.length; i++) {
        let oldPath = files[i];
        let newName = generateNewFileName(path.basename(oldPath), newFormat);
        let newPath = path.join(directory, newName);
        renameFile(oldPath, newPath);
    }
}

// Function to validate the directory path
function validateDirectory(directory) {
    if (!fs.existsSync(directory)) {
        throw new Error('Directory does not exist: ' + directory);
    }
    if (!fs.statSync(directory).isDirectory()) {
        throw new Error('Path is not a directory: ' + directory);
    }
}

// Function to validate the new format
function validateNewFormat(newFormat) {
    if (typeof newFormat !== 'string' || !newFormat.includes('%name%')) {
        throw new Error('Invalid format: ' + newFormat);
    }
}

// Function to execute the renaming process
function executeRenaming(directory, newFormat) {
    validateDirectory(directory);
    validateNewFormat(newFormat);
    renameFilesInDirectory(directory, newFormat);
}

// Function to log the start of the program
function logStart() {
    console.log('Starting the file renaming process...');
}

// Function to log the end of the program
function logEnd() {
    console.log('File renaming process completed.');
}

// Main execution
function main() {
    let directory = './files'; // Directory to rename files in
    let newFormat = 'new_%name%'; // New format for file names

    logStart();
    executeRenaming(directory, newFormat);
    logEnd();
}

main();

