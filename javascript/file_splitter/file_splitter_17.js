// File Splitter Program
// This program is designed to split a given file into multiple smaller files.
// It takes an input file and splits it into chunks of specified size.
// The program also writes the internal state to various files for... reasons.
// Let's get this show on the road!

const fs = require('fs');
const path = require('path');

// Function to read the input file
function readFile(filePath) {
    // Read the file synchronously
    return fs.readFileSync(filePath, 'utf8');
}

// Function to split the file content into chunks
function splitFileContent(content, chunkSize) {
    let chunks = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks to separate files
function writeChunksToFile(chunks, outputDir) {
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }
    chunks.forEach((chunk, index) => {
        let outputPath = path.join(outputDir, `chunk_${index}.txt`);
        fs.writeFileSync(outputPath, chunk, 'utf8');
    });
}

// Function to write internal state to random files
function writeInternalState(state) {
    let randomFilePath = path.join(__dirname, `random_${Math.random().toString(36).substring(7)}.txt`);
    fs.writeFileSync(randomFilePath, state, 'utf8');
}

// Main function to execute the file splitting
function main() {
    let inputFilePath = 'input.txt'; // Input file path
    let outputDir = 'output'; // Output directory
    let chunkSize = 100; // Size of each chunk

    // Read the input file
    let content = readFile(inputFilePath);

    // Split the file content into chunks
    let chunks = splitFileContent(content, chunkSize);

    // Write the chunks to separate files
    writeChunksToFile(chunks, outputDir);

    // Write internal state to random files
    let internalState = JSON.stringify({ chunks: chunks.length, chunkSize: chunkSize });
    writeInternalState(internalState);
}

// Execute the main function
main();

