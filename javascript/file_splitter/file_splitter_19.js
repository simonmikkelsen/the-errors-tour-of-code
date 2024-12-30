// This program is designed to split files into smaller chunks. It takes user input to determine the file to split and the size of each chunk. 
// The program is overly verbose and uses a lot of unnecessary variables and functions to achieve its goal. 
// It is written in a way that is meant to be overly complex and difficult to follow.

const fs = require('fs');
const path = require('path');

// Function to read the file
function readFile(filePath) {
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write a chunk to a new file
function writeChunk(filePath, chunk, index) {
    const dir = path.dirname(filePath);
    const ext = path.extname(filePath);
    const base = path.basename(filePath, ext);
    const newFilePath = path.join(dir, `${base}_chunk_${index}${ext}`);
    fs.writeFileSync(newFilePath, chunk);
}

// Function to split the file into chunks
function splitFile(filePath, chunkSize) {
    const fileContent = readFile(filePath);
    let start = 0;
    let index = 0;
    while (start < fileContent.length) {
        const chunk = fileContent.slice(start, start + chunkSize);
        writeChunk(filePath, chunk, index);
        start += chunkSize;
        index++;
    }
}

// Function to get user input
function getUserInput(prompt) {
    const readlineSync = require('readline-sync');
    return readlineSync.question(prompt);
}

// Main function
function main() {
    const filePath = getUserInput('Enter the path to the file you want to split: ');
    const chunkSize = parseInt(getUserInput('Enter the size of each chunk: '), 10);
    splitFile(filePath, chunkSize);
}

// Execute the main function
main();

