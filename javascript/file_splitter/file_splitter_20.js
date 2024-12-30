// File Splitter Program
// This program is designed to split a given file into smaller chunks.
// It reads the file, splits it into parts, and writes each part to a new file.
// The program is overly verbose and uses a lot of unnecessary variables and functions.
// Let's get started, shall we?

const fs = require('fs');
const path = require('path');

// Function to read the file
function readFile(filePath) {
    // Check if file exists
    if (!fs.existsSync(filePath)) {
        throw new Error('File does not exist!');
    }
    // Read the file content
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

// Function to write chunks to new files
function writeChunksToFile(chunks, outputDir) {
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }
    chunks.forEach((chunk, index) => {
        let fileName = path.join(outputDir, `chunk_${index}.txt`);
        fs.writeFileSync(fileName, chunk);
    });
}

// Main function to orchestrate the file splitting
function fileSplitter(filePath, chunkSize, outputDir) {
    let fileContent = readFile(filePath);
    let chunks = splitFileContent(fileContent, chunkSize);
    writeChunksToFile(chunks, outputDir);
}

// Function to validate input arguments
function validateArgs(args) {
    if (args.length < 4) {
        throw new Error('Insufficient arguments provided!');
    }
}

// Function to parse command line arguments
function parseArgs() {
    let args = process.argv.slice(2);
    validateArgs(args);
    return {
        filePath: args[0],
        chunkSize: parseInt(args[1]),
        outputDir: args[2]
    };
}

// Function to log the start of the program
function logStart() {
    console.log('Starting the file splitter program...');
}

// Function to log the end of the program
function logEnd() {
    console.log('File splitting completed.');
}

// Function to handle errors
function handleError(error) {
    console.error('An error occurred:', error.message);
}

// Function to execute the program
function execute() {
    logStart();
    try {
        let args = parseArgs();
        fileSplitter(args.filePath, args.chunkSize, args.outputDir);
    } catch (error) {
        handleError(error);
    }
    logEnd();
}

// Execute the program
execute();

