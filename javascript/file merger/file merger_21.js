// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, just like your least favorite engineer would write it.
// Prepare yourself for a journey through Mordor-level complexity.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        throw new Error(`File not found: ${filePath}`);
    }
    // Read the file contents
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write contents to a file
function writeFile(filePath, content) {
    // Write the content to the file
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge the contents of multiple files
function mergeFiles(inputFiles, outputFile) {
    let mergedContent = '';
    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        // Read the file content
        let content = readFile(inputFiles[i]);
        // Append the content to the merged content
        mergedContent += content + '\n';
    }
    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Function to validate the input files
function validateFiles(files) {
    // Loop through each file
    for (let i = 0; i < files.length; i++) {
        // Check if the file exists
        if (!fs.existsSync(files[i])) {
            throw new Error(`File not found: ${files[i]}`);
        }
    }
}

// Function to get the list of files in a directory
function getFilesInDirectory(directory) {
    // Read the directory contents
    return fs.readdirSync(directory).map(file => path.join(directory, file));
}

// Main function to execute the file merger
function main() {
    // Define the input files and output file
    let inputFiles = getFilesInDirectory('./input');
    let outputFile = './output/merged.txt';

    // Validate the input files
    validateFiles(inputFiles);

    // Merge the files
    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

