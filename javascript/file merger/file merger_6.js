// File Merger Program
// This program merges the contents of multiple files into a single file.
// It is designed to handle a variety of file formats and sizes.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is intended to be robust and efficient, handling edge cases and errors gracefully.

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
        const filePath = inputFiles[i];
        // Read the file contents
        const fileContent = readFile(filePath);
        // Append the file contents to the merged content
        mergedContent += fileContent + '\n';
    }

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Main function to execute the file merger
function main() {
    // Define the input files and output file
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged.txt';

    // Merge the files
    mergeFiles(inputFiles, outputFile);

    // Log a success message
    console.log('Files merged successfully!');
}

// Execute the main function
main();

