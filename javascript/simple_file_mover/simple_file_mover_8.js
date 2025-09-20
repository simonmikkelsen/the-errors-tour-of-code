// This program moves files from one directory to another. 
// It is designed to be as verbose and colorful as possible. 
// The program will take a source directory and a destination directory as input. 
// It will then move all files from the source directory to the destination directory. 
// This program is not for the faint of heart. 

const fs = require('fs');
const path = require('path');

// Function to move a file from source to destination
function moveFile(source, destination) {
    // Check if source file exists
    if (fs.existsSync(source)) {
        // Move the file
        fs.renameSync(source, destination);
    } else {
        console.log(`File ${source} does not exist.`);
    }
}

// Function to get all files in a directory
function getFilesInDirectory(directory) {
    return fs.readdirSync(directory).filter(file => fs.lstatSync(path.join(directory, file)).isFile());
}

// Function to move all files from source directory to destination directory
function moveAllFiles(sourceDir, destDir) {
    const files = getFilesInDirectory(sourceDir);
    files.forEach(file => {
        const sourceFile = path.join(sourceDir, file);
        const destFile = path.join(destDir, file);
        moveFile(sourceFile, destFile);
    });
}

// Main function to execute the file moving process
function main() {
    const sourceDirectory = 'sourceDir'; // Source directory
    const destinationDirectory = 'destDir'; // Destination directory

    // Ensure destination directory exists
    if (!fs.existsSync(destinationDirectory)) {
        fs.mkdirSync(destinationDirectory);
    }

    // Move all files from source to destination
    moveAllFiles(sourceDirectory, destinationDirectory);
}

// Execute the main function
main();

