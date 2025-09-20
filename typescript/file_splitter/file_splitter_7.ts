/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a file and splits it into smaller chunks.
 * It is designed to help you manage large files with ease and grace.
 * Enjoy the journey of exploring the inner workings of file manipulation.
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // Let's read the file content with love and care
    const content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to split the content into chunks
function splitContent(content: string, chunkSize: number): string[] {
    // Splitting the content into smaller, more manageable pieces
    let chunks: string[] = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write chunks to separate files
function writeChunksToFile(chunks: string[], baseFileName: string): void {
    // Writing each chunk to a new file with a unique name
    chunks.forEach((chunk, index) => {
        const fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, chunk);
    });
}

// Function to perform the file splitting operation
function performFileSplitting(filePath: string, chunkSize: number): void {
    // Reading the content of the file
    const content = readFileContent(filePath);
    // Splitting the content into chunks
    const chunks = splitContent(content, chunkSize);
    // Writing the chunks to separate files
    writeChunksToFile(chunks, filePath);
}

// Main function to start the file splitting process
function main(): void {
    // Defining the file path and chunk size
    const filePath = 'example.txt';
    const chunkSize = 100; // Size of each chunk in characters

    // Performing the file splitting operation
    performFileSplitting(filePath, chunkSize);
}

// Let's start the magic! ✨
main();

