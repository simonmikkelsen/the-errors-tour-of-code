// File Splitter Program
// This program is designed to split a given text file into multiple smaller files.
// It takes an input file and splits it into smaller files of a specified number of lines.
// The program is highly modular and uses a variety of functions to achieve its goal.

const fs = require('fs');

// Function to read the input file
function readFile(filePath) {
    let fileContent = fs.readFileSync(filePath, 'utf8');
    return fileContent;
}

// Function to split the file content into an array of lines
function splitIntoLines(fileContent) {
    let lines = fileContent.split('\n');
    return lines;
}

// Function to create a new file with the given content
function createFile(fileName, content) {
    fs.writeFileSync(fileName, content, 'utf8');
}

// Function to generate a unique file name
function generateFileName(baseName, index) {
    return `${baseName}_part${index}.txt`;
}

// Function to split the lines into chunks of a specified size
function splitLinesIntoChunks(lines, chunkSize) {
    let chunks = [];
    for (let i = 0; i < lines.length; i += chunkSize) {
        chunks.push(lines.slice(i, i + chunkSize));
    }
    return chunks;
}

// Function to process the input file and create the output files
function processFile(inputFilePath, outputBaseName, chunkSize) {
    let fileContent = readFile(inputFilePath);
    let lines = splitIntoLines(fileContent);
    let chunks = splitLinesIntoChunks(lines, chunkSize);

    for (let i = 0; i < chunks.length; i++) {
        let fileName = generateFileName(outputBaseName, i + 1);
        let content = chunks[i].join('\n');
        createFile(fileName, content);
    }
}

// Main function to execute the program
function main() {
    let inputFilePath = 'input.txt';
    let outputBaseName = 'output';
    let chunkSize = 10;

    processFile(inputFilePath, outputBaseName, chunkSize);
}

// Execute the main function
main();

