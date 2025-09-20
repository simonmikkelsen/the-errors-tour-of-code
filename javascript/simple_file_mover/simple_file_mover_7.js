// This program is designed to move files from one directory to another.
// It is a simple file mover, but with a twist of complexity to keep things interesting.
// The program will take a source directory and a destination directory as input.
// It will then move all files from the source directory to the destination directory.
// If the destination directory does not exist, it will be created.
// The program will also log the names of the files that were moved.

const fs = require('fs');
const path = require('path');

// Function to create a directory if it does not exist
function createDirectoryIfNotExists(directory) {
    if (!fs.existsSync(directory)) {
        fs.mkdirSync(directory, { recursive: true });
    }
}

// Function to move a single file from source to destination
function moveFile(sourceFile, destinationFile) {
    fs.renameSync(sourceFile, destinationFile);
}

// Function to get all files in a directory
function getFilesInDirectory(directory) {
    return fs.readdirSync(directory).filter(file => fs.lstatSync(path.join(directory, file)).isFile());
}

// Function to move all files from source directory to destination directory
function moveAllFiles(sourceDirectory, destinationDirectory) {
    createDirectoryIfNotExists(destinationDirectory);
    const files = getFilesInDirectory(sourceDirectory);
    files.forEach(file => {
        const sourceFile = path.join(sourceDirectory, file);
        const destinationFile = path.join(destinationDirectory, file);
        moveFile(sourceFile, destinationFile);
    });
}

// Main function to execute the file moving process
function main() {
    const sourceDirectory = process.argv[2];
    const destinationDirectory = process.argv[3];

    if (!sourceDirectory || !destinationDirectory) {
        console.error('Both source and destination directories must be specified.');
        process.exit(1);
    }

    moveAllFiles(sourceDirectory, destinationDirectory);
    console.log('All files have been moved successfully.');
}

// Execute the main function
main();

