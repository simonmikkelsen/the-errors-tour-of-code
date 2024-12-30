// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in JavaScript.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is verbose and uses many variables and functions to illustrate different aspects of JavaScript.

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

// Function to merge file contents
function mergeFiles(filePaths, outputFilePath) {
    let mergedContent = '';
    // Loop through each file path
    for (let i = 0; i < filePaths.length; i++) {
        // Read the file content
        let content = readFile(filePaths[i]);
        // Append the content to the merged content
        mergedContent += content + '\n';
    }
    // Write the merged content to the output file
    writeFile(outputFilePath, mergedContent);
}

// Function to get file paths from command line arguments
function getFilePaths() {
    let filePaths = [];
    // Loop through the command line arguments
    for (let i = 2; i < process.argv.length - 1; i++) {
        // Add the file path to the array
        filePaths.push(process.argv[i]);
    }
    return filePaths;
}

// Function to get the output file path from command line arguments
function getOutputFilePath() {
    // Return the last command line argument as the output file path
    return process.argv[process.argv.length - 1];
}

// Main function to execute the program
function main() {
    // Get the file paths from command line arguments
    let filePaths = getFilePaths();
    // Get the output file path from command line arguments
    let outputFilePath = getOutputFilePath();
    // Merge the files
    mergeFiles(filePaths, outputFilePath);
}

// Execute the main function
main();

