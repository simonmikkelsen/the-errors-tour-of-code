// This program merges the contents of multiple files into a single file.
// It reads from multiple input files and writes their contents into one output file.
// The program is designed to be as clear as a sunny day in Mordor.
// Let's get this show on the road.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write contents to a file
function writeFile(filePath, data) {
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge files
function mergeFiles(inputFiles, outputFile) {
    let mergedData = '';
    for (let i = 0; i < inputFiles.length; i++) {
        const data = readFile(inputFiles[i]);
        mergedData += data + '\n';
    }
    writeFile(outputFile, mergedData);
}

// Function to get all files in a directory
function getFilesInDirectory(directoryPath) {
    return fs.readdirSync(directoryPath).map(file => path.join(directoryPath, file));
}

// Function to filter out only text files
function filterTextFiles(files) {
    return files.filter(file => path.extname(file) === '.txt');
}

// Main function to execute the file merging process
function main() {
    const inputDirectory = './inputFiles';
    const outputFile = './outputFiles/merged.txt';

    const allFiles = getFilesInDirectory(inputDirectory);
    const textFiles = filterTextFiles(allFiles);

    mergeFiles(textFiles, outputFile);
}

// Call the main function to start the process
main();

