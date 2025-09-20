// This program is a file merger. It takes input from the user, reads the content of two files, and merges them into a new file. 
// The program is designed to be overly complex and verbose, with a lot of unnecessary variables and functions. 
// It is written in a slightly angry and colorful language, with detailed comments explaining each step.

const fs = require('fs');
const path = require('path');

// Function to read the content of a file
function readFileContent(filePath) {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        throw new Error(`File not found: ${filePath}`);
    }
    // Read the file content
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write content to a file
function writeFileContent(filePath, content) {
    // Write the content to the file
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge two files
function mergeFiles(file1, file2, outputFile) {
    // Read the content of the first file
    const content1 = readFileContent(file1);
    // Read the content of the second file
    const content2 = readFileContent(file2);
    // Merge the content of the two files
    const mergedContent = content1 + '\n' + content2;
    // Write the merged content to the output file
    writeFileContent(outputFile, mergedContent);
}

// Function to get user input
function getUserInput(prompt) {
    // Prompt the user for input
    const readlineSync = require('readline-sync');
    return readlineSync.question(prompt);
}

// Main function
function main() {
    // Get the first file path from the user
    const file1 = getUserInput('Enter the path of the first file: ');
    // Get the second file path from the user
    const file2 = getUserInput('Enter the path of the second file: ');
    // Get the output file path from the user
    const outputFile = getUserInput('Enter the path of the output file: ');
    // Merge the files
    mergeFiles(file1, file2, outputFile);
    // Print a success message