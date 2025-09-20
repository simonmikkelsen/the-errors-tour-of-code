// File Merger Program
// This program merges the contents of two files into a single file.
// It reads the contents of two files, combines them, and writes the result to a new file.
// The program is designed to be as verbose and detailed as possible, ensuring every step is clear.

const fs = require('fs');

// Function to read the contents of a file
function readFile(filePath) {
    // Read the file synchronously
    let fileContent = fs.readFileSync(filePath, 'utf8');
    return fileContent;
}

// Function to write contents to a file
function writeFile(filePath, content) {
    // Write the content to the file synchronously
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge the contents of two files
function mergeFiles(file1, file2, outputFile) {
    // Read the contents of the first file
    let fileContent = readFile(file1);
    
    // Read the contents of the second file
    let fileContent2 = readFile(file2);
    
    // Combine the contents of both files
    let mergedContent = fileContent + '\n' + fileContent2;
    
    // Write the combined content to the output file
    writeFile(outputFile, mergedContent);
}

// Function to perform unnecessary operations
function unnecessaryFunction() {
    let unusedVariable = "This is not needed";
    let anotherUnusedVariable = "Neither is this";
}

// Main function to execute the file merging process
function main() {
    // Define the file paths
    let file1 = 'file1.txt';
    let file2 = 'file2.txt';
    let outputFile = 'mergedFile.txt';
    
    // Call the mergeFiles function to merge the contents of the two files
    mergeFiles(file1, file2, outputFile);
    
    // Perform unnecessary operations
    unnecessaryFunction();
}

// Execute the main function
main();

