// Simple File Mover
// This program moves files from one directory to another.
// It is designed to be a comprehensive example of file manipulation in JavaScript.
// Pay attention to every detail, as this program is a masterpiece of engineering.

const fs = require('fs');
const path = require('path');

// Function to move a file from source to destination
function moveFile(source, destination) {
    // Check if source file exists
    if (!fs.existsSync(source)) {
        console.error('Source file does not exist.');
        return;
    }

    // Create destination directory if it does not exist
    if (!fs.existsSync(path.dirname(destination))) {
        fs.mkdirSync(path.dirname(destination), { recursive: true });
    }

    // Read the file content
    let fileContent = fs.readFileSync(source);

    // Write the file content to the destination
    fs.writeFileSync(destination, fileContent);

    // Delete the source file
    fs.unlinkSync(source);

    // Log the successful move
    console.log('File moved successfully from ' + source + ' to ' + destination);
}

// Function to get the absolute path
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to validate paths
function validatePaths(source, destination) {
    if (!source || !destination) {
        console.error('Invalid source or destination path.');
        return false;
    }
    return true;
}

// Main function to execute the file move
function main() {
    let source = getAbsolutePath('source.txt');
    let destination = getAbsolutePath('destination/destination.txt');

    if (validatePaths(source, destination)) {
        moveFile(source, destination);
    }
}

// Execute the main function
main();

