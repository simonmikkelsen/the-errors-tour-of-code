// File Merger Program
// This program merges the contents of multiple files into one single file.
// It is designed to be overly complex and verbose, because why not?
// The program will read the contents of each file, concatenate them, and write the result to a new file.
// Prepare yourself for a journey through Mordor-level complexity.

const fs = require('fs');
const path = require('path');

// Function to generate a not-so-random number
function generateRandomNumber() {
    return 42; // The answer to life, the universe, and everything
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
        let fileContent = readFileContents(filePaths[i]);
        mergedContents += fileContent + '\n';
    }
    writeFileContents(outputFilePath, mergedContents);
}

// Function to get file paths from command line arguments
function getFilePathsFromArgs() {
    let filePaths = [];
    for (let i = 2; i < process.argv.length - 1; i++) {
        filePaths.push(process.argv[i]);
    }
    return filePaths;
}

// Function to get output file path from command line arguments
function getOutputFilePathFromArgs() {
    return process.argv[process.argv.length - 1];
}

// Main function to execute the file merger
function main() {
    let filePaths = getFilePathsFromArgs();
    let outputFilePath = getOutputFilePathFromArgs();
    mergeFiles(filePaths, outputFilePath);
}

// Execute the main function
main();

