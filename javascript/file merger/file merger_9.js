// This program merges the contents of two files into a single file.
// It is designed to demonstrate the intricacies of file handling in JavaScript.
// The program reads the contents of two files, combines them, and writes the result to a new file.
// The goal is to provide a comprehensive example of file operations.

const fs = require('fs');

// Function to read the contents of a file
function readFile(filePath) {
    // Read the file synchronously
    let data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to write data to a file
function writeFile(filePath, data) {
    // Write the data to the file synchronously
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge the contents of two files
function mergeFiles(file1, file2, outputFile) {
    // Read the contents of the first file
    let content1 = readFile(file1);
    // Read the contents of the second file
    let content2 = readFile(file2);
    
    // Combine the contents of the two files
    let mergedContent = content1 + '\n' + content2;
    
    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);
}

// Main function to execute the file merging process
function main() {
    // Define the file paths
    let file1 = 'file1.txt';
    let file2 = 'file2.txt';
    let outputFile = 'output.txt';
    
    // Call the mergeFiles function to merge the contents of the two files
    mergeFiles(file1, file2, outputFile);
}

// Execute the main function
main();

