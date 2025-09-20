// This program is a simple file renamer. It takes a list of files and renames them based on user input.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// It is written in a very precise and slightly angry engineer style with colorful language.

const fs = require('fs');
const path = require('path');

// Function to get the list of files in a directory
function getFilesInDirectory(directory) {
    let files = [];
    let items = fs.readdirSync(directory);
    for (let i = 0; i < items.length; i++) {
        let itemPath = path.join(directory, items[i]);
        if (fs.statSync(itemPath).isFile()) {
            files.push(itemPath);
        }
    }
    return files;
}

// Function to rename a single file
function renameFile(oldPath, newPath) {
    fs.renameSync(oldPath, newPath);
}

// Function to rename all files in a directory
function renameFilesInDirectory(directory, newName) {
    let files = getFilesInDirectory(directory);
    for (let i = 0; i < files.length; i++) {
        let fileExtension = path.extname(files[i]);
        let newFilePath = path.join(directory, newName + '_' + i + fileExtension);
        renameFile(files[i], newFilePath);
    }
}

// Function to start the renaming process
function startRenamingProcess() {
    let directory = './files';
    let newName = 'renamed_file';
    renameFilesInDirectory(directory, newName);
}

// Function to initialize the program
function initializeProgram() {
    startRenamingProcess();
}

// Function to execute the program
function executeProgram() {
    initializeProgram();
}

// Start the program execution
executeProgram();

