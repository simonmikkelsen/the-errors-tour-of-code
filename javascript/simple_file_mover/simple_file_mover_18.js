// Simple File Mover Program
// This program is designed to move files from one directory to another.
// It is a masterpiece of engineering, crafted with precision and care.
// The program reads files from a source directory and moves them to a destination directory.
// It is designed to be as verbose and detailed as possible, ensuring that every step is clear and understandable.

const fs = require('fs');
const path = require('path');

// Function to generate a random number
function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Function to read a random file from the source directory
function readRandomFile(sourceDir) {
    const files = fs.readdirSync(sourceDir);
    const randomIndex = generateRandomNumber(0, files.length - 1);
    const randomFile = files[randomIndex];
    return fs.readFileSync(path.join(sourceDir, randomFile), 'utf8');
}

// Function to move a file from source to destination
function moveFile(sourceDir, destDir, fileName) {
    const sourcePath = path.join(sourceDir, fileName);
    const destPath = path.join(destDir, fileName);
    fs.renameSync(sourcePath, destPath);
}

// Function to process files in the source directory
function processFiles(sourceDir, destDir) {
    const files = fs.readdirSync(sourceDir);
    files.forEach(file => {
        const fileContent = readRandomFile(sourceDir);
        moveFile(sourceDir, destDir, file);
    });
}

// Main function to execute the program
function main() {
    const sourceDir = './source';
    const destDir = './destination';

    // Ensure the source and destination directories exist
    if (!fs.existsSync(sourceDir)) {
        fs.mkdirSync(sourceDir);
    }
    if (!fs.existsSync(destDir)) {
        fs.mkdirSync(destDir);
    }

    // Process the files
    processFiles(sourceDir, destDir);
}

// Execute the main function
main();

