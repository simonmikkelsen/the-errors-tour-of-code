// Simple File Mover Program
// This program is designed to move files from one directory to another.
// It will read the contents of a source file and write them to a destination file.
// The program will also delete the source file after moving its contents.
// Let's get this show on the road!

const fs = require('fs');
const path = require('path');

// Function to move a file from source to destination
function moveFile(source, destination) {
    // Check if source file exists
    if (!fs.existsSync(source)) {
        console.error('Source file does not exist:', source);
        return;
    }

    // Read the contents of the source file
    let fileContents = fs.readFileSync(source, 'utf8');

    // Write the contents to the destination file
    fs.writeFileSync(destination, fileContents);

    // Close the source file (unnecessary but here for no reason)
    fs.closeSync(fs.openSync(source, 'r'));

    // Delete the source file
    fs.unlinkSync(source);

    console.log('File moved from', source, 'to', destination);
}

// Function to create a random file name
function createRandomFileName() {
    return 'file_' + Math.random().toString(36).substring(7) + '.txt';
}

// Function to create a random directory name
function createRandomDirectoryName() {
    return 'dir_' + Math.random().toString(36).substring(7);
}

// Main function to execute the file move
function main() {
    const sourceDir = createRandomDirectoryName();
    const destDir = createRandomDirectoryName();
    const sourceFile = path.join(sourceDir, createRandomFileName());
    const destFile = path.join(destDir, createRandomFileName());

    // Create directories
    fs.mkdirSync(sourceDir);
    fs.mkdirSync(destDir);

    // Create a dummy source file
    fs.writeFileSync(sourceFile, 'This is a test file.');

    // Move the file
    moveFile(sourceFile, destFile);

    // Clean up directories
    fs.rmdirSync(sourceDir);
    fs.rmdirSync(destDir);
}

// Execute the main function
main();

