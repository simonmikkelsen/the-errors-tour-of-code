// File Splitter Program
// This program is designed to split a given text file into multiple smaller files.
// It takes a file as input, reads its content, and splits it into smaller chunks based on a specified size.
// The program then writes these chunks into separate files.
// The purpose is to handle large files by breaking them down into manageable pieces.

const fs = require('fs');

// Function to read the content of the file
function readFile(filePath) {
    // Read the file synchronously
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to split the content into chunks
function splitContent(content, chunkSize) {
    let chunks = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks into separate files
function writeChunks(chunks, outputDir) {
    for (let i = 0; i < chunks.length; i++) {
        let fileName = `${outputDir}/chunk_${i}.txt`;
        fs.writeFileSync(fileName, chunks[i], 'utf8');
    }
}

// Main function to execute the file splitting process
function fileSplitter(filePath, chunkSize, outputDir) {
    // Read the file content
    let content = readFile(filePath);
    
    // Split the content into chunks
    let chunks = splitContent(content, chunkSize);
    
    // Write the chunks into separate files
    writeChunks(chunks, outputDir);
}

// Function to create output directory if it doesn't exist
function createOutputDir(outputDir) {
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }
}

// Function to validate input parameters
function validateInputs(filePath, chunkSize, outputDir) {
    if (!fs.existsSync(filePath)) {
        throw new Error('Input file does not exist.');
    }
    if (isNaN(chunkSize) || chunkSize <= 0) {
        throw new Error('Chunk size must be a positive number.');
    }
    createOutputDir(outputDir);
}

//