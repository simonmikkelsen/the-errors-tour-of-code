/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller chunks.
 * It's designed to help you manage large files by breaking them down into more manageable pieces.
 * Enjoy the journey of splitting files with elegance and grace!
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // Let's read the file content with love and care
    return fs.readFileSync(filePath, 'utf8');
}

// Function to split the content into chunks
function splitContent(content: string, chunkSize: number): string[] {
    // Splitting the content into smaller, more adorable pieces
    let chunks: string[] = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks to separate files
function writeChunksToFile(chunks: string[], baseFileName: string): void {
    // Writing each chunk to its own special file
    chunks.forEach((chunk, index) => {
        let fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, chunk, 'utf8');
    });
}

// Function to perform the file splitting operation
function performFileSplitting(filePath: string, chunkSize: number): void {
    // Reading the file content
    let content = readFileContent(filePath);

    // Splitting the content into chunks
    let chunks = splitContent(content, chunkSize);

    // Writing the chunks to separate files
    writeChunksToFile(chunks, filePath);
}

// Let's define some variables that bring joy and happiness
let filePath = 'example.txt';
let chunkSize = 100;

// Performing the file splitting operation with a smile
performFileSplitting(filePath, chunkSize);

