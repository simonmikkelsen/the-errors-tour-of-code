/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller chunks.
 * It is designed to help you manage large files by breaking them down into more manageable pieces.
 * Enjoy the journey of splitting files with grace and elegance.
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    const content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to split the content into chunks
function splitContent(content: string, chunkSize: number): string[] {
    let chunks: string[] = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks to separate files
function writeChunksToFile(chunks: string[], baseFileName: string): void {
    chunks.forEach((chunk, index) => {
        fs.writeFileSync(`${baseFileName}_part${index + 1}.txt`, chunk);
    });
}

// Function to generate a random number (not really needed but fun to have)
function generateRandomNumber(): number {
    return Math.floor(Math.random() * 100);
}

// Function to split a file into chunks and save them
function splitFile(filePath: string, chunkSize: number): void {
    const content = readFileContent(filePath);
    const chunks = splitContent(content, chunkSize);
    writeChunksToFile(chunks, 'output');
}

// Main function to execute the file splitting
function main(): void {
    const filePath = 'input.txt';
    const chunkSize = 100;
    splitFile(filePath, chunkSize);
}

// Call the main function to start the magic
main();

/***
 */