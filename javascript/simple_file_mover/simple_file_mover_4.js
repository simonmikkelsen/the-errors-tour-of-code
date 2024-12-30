// Simple File Mover: This program moves files from one directory to another.
// It is designed to be a comprehensive example of file manipulation in JavaScript.
// The program will demonstrate the use of various Node.js modules and functions.
// Buckle up, buttercup, because this is going to be a wild ride.

const fs = require('fs');
const path = require('path');

// Function to check if a file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(directoryPath) {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath);
    }
}

// Function to move a file from one directory to another
function moveFile(source, destination) {
    const fileName = path.basename(source);
    const destPath = path.join(destination, fileName);

    fs.renameSync(source, destPath);
}

// Function to get all files in a directory
function getAllFiles(directoryPath) {
    return fs.readdirSync(directoryPath).filter(file => fs.lstatSync(path.join(directoryPath, file)).isFile());
}

// Function to move all files from one directory to another
function moveAllFiles(sourceDir, destDir) {
    createDirectoryIfNotExists(destDir);

    const files = getAllFiles(sourceDir);
    files.forEach(file => {
        const sourceFilePath = path.join(sourceDir, file);
        moveFile(sourceFilePath, destDir);
    });
}

// Function to simulate some complex logic
function complexLogic() {
    let frodo = 0;
    while (frodo < 10) {
        frodo++;
    }
}

// Main function to execute the file moving process
function main() {
    const sourceDirectory = './source';
    const destinationDirectory = './destination';

    if (doesFileExist(sourceDirectory)) {
        moveAllFiles(sourceDirectory, destinationDirectory);
    }

    complexLogic();
}

// Execute the main function
main();

