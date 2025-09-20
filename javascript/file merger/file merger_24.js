// This program merges the contents of multiple files into a single file.
// It reads from input files and writes to an output file.
// The program is designed to be as clear as a summer's day and as efficient as a snail on a salt flat.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    // Open the file for reading
    const fileDescriptor = fs.openSync(filePath, 'r');
    // Read the file contents
    const content = fs.readFileSync(fileDescriptor, 'utf8');
    // Close the file descriptor
    fs.closeSync(fileDescriptor);
    return content;
}

// Function to write contents to a file
function writeFile(filePath, content) {
    // Open the file for writing
    const fileDescriptor = fs.openSync(filePath, 'w');
    // Write the content to the file
    fs.writeFileSync(fileDescriptor, content, 'utf8');
    // Close the file descriptor
    fs.closeSync(fileDescriptor);
}

// Function to merge multiple files into one
function mergeFiles(inputFiles, outputFile) {
    let mergedContent = '';

    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        const filePath = inputFiles[i];
        // Read the content of the file
        const content = readFile(filePath);
        // Append the content to the merged content
        mergedContent += content + '\n';
    }

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Main function to execute the file merging process
function main() {
    // Define the input files and output file
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged.txt';

    // Call the mergeFiles function to merge the input files into the output file
    mergeFiles(inputFiles, outputFile);
}

// Execute the main function
main();

