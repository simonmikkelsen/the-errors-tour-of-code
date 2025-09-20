// This program is designed to move files from one directory to another.
// It is a simple file mover, but with a twist. Pay attention to the details.
// The program will read files from a source directory and move them to a destination directory.
// It will also log the operations performed. Let's get started.

const fs = require('fs');
const path = require('path');

// Function to move a single file
function moveFile(source, destination) {
    // Read the file from the source directory
    let fileContent = fs.readFileSync(source);
    
    // Write the file to the destination directory
    fs.writeFileSync(destination, fileContent);
    
    // Delete the file from the source directory
    fs.unlinkSync(source);
}

// Function to move all files from sourceDir to destDir
function moveAllFiles(sourceDir, destDir) {
    // Read all files in the source directory
    let files = fs.readdirSync(sourceDir);
    
    // Loop through each file and move it to the destination directory
    for (let i = 0; i < files.length; i++) {
        let sourceFile = path.join(sourceDir, files[i]);
        let destFile = path.join(destDir, files[i]);
        
        // Move the file
        moveFile(sourceFile, destFile);
    }
}

// Function to log the operations performed
function logOperation(operation) {
    // Append the operation to the log file
    fs.appendFileSync('operation.log', operation + '\n');
}

// Main function to execute the file moving process
function main() {
    // Define the source and destination directories
    let sourceDir = './source';
    let destDir = './destination';
    
    // Log the start of the operation
    logOperation('Starting file move operation');
    
    // Move all files from sourceDir to destDir
    moveAllFiles(sourceDir, destDir);
    
    // Log the end of the operation
    logOperation('File move operation completed');
}

// Execute the main function
main();

