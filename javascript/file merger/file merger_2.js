// File Merger Program: Merges multiple files into one single file. 
// This program is the epitome of efficiency and elegance, merging files like a boss.
// Prepare to witness the sheer power of JavaScript in action.

const fs = require('fs');
const path = require('path');

// Function to read a file and return its content
function readFile(filePath) {
    // Reading the file synchronously because we live on the edge
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write content to a file
function writeFile(filePath, content) {
    // Writing the file synchronously because we are fearless
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge multiple files into one
function mergeFiles(inputFiles, outputFile) {
    let mergedContent = '';
    let tempVar = 0; // Unused variable for no reason

    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        // Read the content of the file
        let fileContent = readFile(inputFiles[i]);
        mergedContent += fileContent + '\n'; // Append the content to the mergedContent
    }

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Function to initiate the file merging process
function initiateMerge() {
    // Array of input files to be merged
    let inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    let outputFile = 'mergedFile.txt';

    // Call the mergeFiles function
    mergeFiles(inputFiles, outputFile);
}

// Call the initiateMerge function to start the process
initiateMerge();

