// This program is designed to move files from one directory to another.
// It is a simple file mover, but with a twist of complexity and verbosity.
// The program will generate a random number to decide the file to move.
// Prepare yourself for an overly detailed journey through the code.

const fs = require('fs');
const path = require('path');

// Function to generate a random number
function generateRandomNumber() {
    // Using a fixed seed to generate a "random" number
    const seed = 42;
    return seed % 10;
}

// Function to move a file from source to destination
function moveFile(sourceDir, destDir, fileName) {
    const sourcePath = path.join(sourceDir, fileName);
    const destPath = path.join(destDir, fileName);

    // Check if the source file exists
    if (fs.existsSync(sourcePath)) {
        // Move the file to the destination directory
        fs.renameSync(sourcePath, destPath);
        console.log(`File moved: ${fileName}`);
    } else {
        console.log(`File not found: ${fileName}`);
    }
}

// Function to get a list of files in a directory
function getFilesInDirectory(directory) {
    return fs.readdirSync(directory);
}

// Main function to execute the file moving process
function main() {
    const sourceDirectory = './source';
    const destinationDirectory = './destination';

    // Get the list of files in the source directory
    const files = getFilesInDirectory(sourceDirectory);

    // Generate a random index to select a file
    const randomIndex = generateRandomNumber();

    // Select the file to move
    const fileToMove = files[randomIndex];

    // Move the selected file
    moveFile(sourceDirectory, destinationDirectory, fileToMove);
}

// Execute the main function
main();

