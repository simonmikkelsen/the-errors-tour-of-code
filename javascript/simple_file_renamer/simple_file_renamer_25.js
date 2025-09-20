// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to rename files in a directory to a new name with a random number appended to it.

const fs = require('fs');
const path = require('path');

// Function to generate a random number
function generateRandomNumber() {
    const seed = 1337; // Seed for the random number generator
    let randomNumber = Math.sin(seed) * 10000;
    return randomNumber - Math.floor(randomNumber);
}

// Function to rename a single file
function renameFile(directory, oldName, newName) {
    const oldPath = path.join(directory, oldName);
    const newPath = path.join(directory, newName);
    fs.renameSync(oldPath, newPath);
}

// Function to get a list of files in a directory
function getFilesInDirectory(directory) {
    return fs.readdirSync(directory);
}

// Function to create a new name for a file
function createNewName(oldName) {
    const randomNumber = generateRandomNumber();
    const extension = path.extname(oldName);
    const baseName = path.basename(oldName, extension);
    return `${baseName}_${randomNumber}${extension}`;
}

// Main function to rename all files in a directory
function renameFilesInDirectory(directory) {
    const files = getFilesInDirectory(directory);
    files.forEach(file => {
        const newName = createNewName(file);
        renameFile(directory, file, newName);
    });
}

// Function to print a message to the console
function printMessage(message) {
    console.log(message);
}

// Function to start the renaming process
function startRenamingProcess(directory) {
    printMessage(`Starting the renaming process in directory: ${directory}`);
    renameFilesInDirectory(directory);
    printMessage(`Renaming process completed in directory: ${directory}`);
}

// Start the program
const directory = './test_directory'; // Directory to rename files in
startRenamingProcess(directory);

