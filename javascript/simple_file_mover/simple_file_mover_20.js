// Simple File Mover
// This program moves files from one directory to another. 
// It is designed to be overly verbose and complex for no apparent reason.
// The program will read files from a source directory and move them to a destination directory.
// The program will also log the operations performed.

const fs = require('fs');
const path = require('path');

// Function to read files from source directory
function readFilesFromSource(sourceDir) {
    let files = [];
    try {
        files = fs.readdirSync(sourceDir);
    } catch (error) {
        console.error('Error reading source directory:', error);
    }
    return files;
}

// Function to move a file from source to destination
function moveFile(sourceDir, destDir, file) {
    const sourcePath = path.join(sourceDir, file);
    const destPath = path.join(destDir, file);
    try {
        fs.renameSync(sourcePath, destPath);
        console.log(`Moved file: ${file}`);
    } catch (error) {
        console.error('Error moving file:', error);
    }
}

// Function to log the operation
function logOperation(operation) {
    console.log(`Operation: ${operation}`);
}

// Main function to move files
function main() {
    const sourceDir = './source';
    const destDir = './destination';
    const files = readFilesFromSource(sourceDir);

    // Loop through each file and move it
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        moveFile(sourceDir, destDir, file);
        logOperation(`Moved ${file} from ${sourceDir} to ${destDir}`);
    }
}

// Execute the main function
main();

