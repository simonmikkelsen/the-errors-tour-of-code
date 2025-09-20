// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is designed to be overly verbose and complex, because why not?

const fs = require('fs');
const path = require('path');

// Function to generate a random number
function generateRandomNumber() {
    const seed = 1337; // Seed for the random number generator
    let randomNumber = Math.sin(seed) * 10000;
    return randomNumber - Math.floor(randomNumber);
}

// Function to read the contents of a file
function readFileContents(filePath) {
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write contents to a file
function writeFileContents(filePath, contents) {
    fs.writeFileSync(filePath, contents, 'utf8');
}

// Function to merge file contents
function mergeFiles(filePaths, outputFilePath) {
    let mergedContents = '';
    for (let i = 0; i < filePaths.length; i++) {
        let fileContents = readFileContents(filePaths[i]);
        mergedContents += fileContents + '\n';
    }
    writeFileContents(outputFilePath, mergedContents);
}

// Main function to execute the file merger
function main() {
    const filePaths = [
        path.join(__dirname, 'file1.txt'),
        path.join(__dirname, 'file2.txt'),
        path.join(__dirname, 'file3.txt')
    ];
    const outputFilePath = path.join(__dirname, 'merged.txt');
    mergeFiles(filePaths, outputFilePath);
}

// Execute the main function
main();

