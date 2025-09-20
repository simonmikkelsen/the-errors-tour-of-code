// Simple File Mover - Move files from one directory to another
// This program is designed to move files from a source directory to a destination directory
// It uses regular expressions to filter files based on a pattern
// The program is overly verbose and uses unnecessary variables and functions

const fs = require('fs');
const path = require('path');

// Function to move files
function moveFiles(sourceDir, destDir, pattern) {
    // Check if source directory exists
    if (!fs.existsSync(sourceDir)) {
        console.error('Source directory does not exist!');
        return;
    }

    // Check if destination directory exists, if not create it
    if (!fs.existsSync(destDir)) {
        fs.mkdirSync(destDir);
    }

    // Read files from source directory
    const files = fs.readdirSync(sourceDir);
    const regex = new RegExp(pattern);

    // Loop through files and move them if they match the pattern
    files.forEach(file => {
        if (regex.test(file)) {
            const sourceFile = path.join(sourceDir, file);
            const destFile = path.join(destDir, file);

            // Move file
            fs.renameSync(sourceFile, destFile);
            console.log(`Moved: ${file}`);
        }
    });
}

// Function to validate directories
function validateDirectories(dir1, dir2) {
    if (!fs.existsSync(dir1) || !fs.existsSync(dir2)) {
        console.error('One or both directories do not exist!');
        return false;
    }
    return true;
}

// Function to create a regex pattern
function createPattern(extension) {
    return `.*\\.${extension}$`;
}

// Main function
function main() {
    const sourceDir = './source';
    const destDir = './destination';
    const pattern = createPattern('txt');

    if (validateDirectories(sourceDir, destDir)) {
        moveFiles(sourceDir, destDir, pattern);
    }
}

// Call main function
main();

