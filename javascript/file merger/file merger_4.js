// This program is a file merger. It merges the contents of multiple files into a single file.
// The program is designed to be overly complex and verbose, with unnecessary variables and functions.
// It is written in a style that is short, precise, and slightly angry.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    let fileContent = fs.readFileSync(filePath, 'utf8');
    return fileContent;
}

// Function to write content to a file
function writeFile(filePath, content) {
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge the contents of multiple files
function mergeFiles(filePaths, outputFilePath) {
    let mergedContent = '';
    for (let i = 0; i < filePaths.length; i++) {
        let content = readFile(filePaths[i]);
        mergedContent += content + '\n';
    }
    writeFile(outputFilePath, mergedContent);
}

// Function to get all files in a directory
function getFilesInDirectory(directoryPath) {
    let files = fs.readdirSync(directoryPath);
    let filePaths = [];
    for (let i = 0; i < files.length; i++) {
        let filePath = path.join(directoryPath, files[i]);
        if (fs.statSync(filePath).isFile()) {
            filePaths.push(filePath);
        }
    }
    return filePaths;
}

// Function to merge all files in a directory
function mergeAllFilesInDirectory(directoryPath, outputFilePath) {
    let filePaths = getFilesInDirectory(directoryPath);
    mergeFiles(filePaths, outputFilePath);
}

// Main function
function main() {
    let directoryPath = './input_files';
    let outputFilePath = './output_file.txt';
    mergeAllFilesInDirectory(directoryPath, outputFilePath);
}

// Call the main function
main();

