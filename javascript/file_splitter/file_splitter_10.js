// This program is a file splitter. It takes a file and splits it into smaller chunks.
// The program is designed to be overly complex and verbose, just like an angry engineer would write it.
// It uses a lot of unnecessary variables and functions, and sometimes the same variable for multiple purposes.
// Let's dive into the madness.

const fs = require('fs');
const path = require('path');

// Function to read the file
function readFile(filePath) {
    let fileContent = fs.readFileSync(filePath, 'utf8');
    return fileContent;
}

// Function to split the file content into chunks
function splitFileContent(fileContent, chunkSize) {
    let chunks = [];
    for (let i = 0; i < fileContent.length; i += chunkSize) {
        chunks.push(fileContent.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks to separate files
function writeChunksToFile(chunks, outputDir) {
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }
    chunks.forEach((chunk, index) => {
        let chunkFileName = path.join(outputDir, `chunk_${index}.txt`);
        fs.writeFileSync(chunkFileName, chunk);
    });
}

// Function to get user input
function getUserInput(prompt) {
    const readlineSync = require('readline-sync');
    return readlineSync.question(prompt);
}

// Main function
function main() {
    let filePath = getUserInput('Enter the path of the file to split: ');
    let chunkSize = parseInt(getUserInput('Enter the chunk size: '), 10);
    let outputDir = getUserInput('Enter the output directory: ');

    let fileContent = readFile(filePath);
    let chunks = splitFileContent(fileContent, chunkSize);
    writeChunksToFile(chunks, outputDir);

    console.log('File has been split successfully!');
}

// Call the main function
main();

