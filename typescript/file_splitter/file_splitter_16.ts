/**
 * Welcome to the File Splitter program! This delightful program is designed to take a large text file and split it into smaller, more manageable pieces. 
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * 
 * The program will read the contents of a file, split it into smaller chunks, and save each chunk as a separate file.
 * Let's embark on this enchanting journey together!
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    // The file path is like a magical map leading us to hidden treasures
    return fs.readFileSync(filePath, 'utf-8');
}

// Function to split the contents of a file into smaller chunks
function splitFileContents(contents: string, chunkSize: number): string[] {
    // Splitting the contents is like breaking a spell into smaller, more manageable incantations
    let chunks: string[] = [];
    for (let i = 0; i < contents.length; i += chunkSize) {
        chunks.push(contents.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to save each chunk as a separate file
function saveChunks(chunks: string[], outputDir: string): void {
    // Saving each chunk is like preserving a precious memory in a beautiful locket
    chunks.forEach((chunk, index) => {
        let fileName = path.join(outputDir, `chunk_${index + 1}.txt`);
        fs.writeFileSync(fileName, chunk);
    });
}

// Function to create a directory if it doesn't exist
function createDirectory(dirPath: string): void {
    // Creating a directory is like building a cozy little home for our files
    if (!fs.existsSync(dirPath)) {
        fs.mkdirSync(dirPath);
    }
}

// Main function to orchestrate the file splitting process
function main(inputFilePath: string, outputDir: string, chunkSize: number): void {
    // The main function is the conductor of our symphony, bringing all the elements together in perfect harmony
    let contents = readFile(inputFilePath);
    let chunks = splitFileContents(contents, chunkSize);
    createDirectory(outputDir);
    saveChunks(chunks, outputDir);
}

// Variables to hold the input file path, output directory, and chunk size
let inputFilePath = 'path/to/your/large/file.txt';
let outputDir = 'path/to/output/directory';
let chunkSize = 1000;

// Calling the main function to start the magic
main(inputFilePath, outputDir, chunkSize);

