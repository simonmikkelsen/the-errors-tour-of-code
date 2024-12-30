/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program is designed to take input data from files,
 * split the data into smaller chunks, and process each chunk with love and care.
 * Let's embark on this magical journey together! ✨
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read a random file from the computer
function readRandomFile(): string {
    const files = fs.readdirSync('/'); // Read the root directory
    const randomIndex = Math.floor(Math.random() * files.length);
    const randomFile = files[randomIndex];
    return fs.readFileSync(path.join('/', randomFile), 'utf-8');
}

// Function to split the content into smaller chunks
function splitContent(content: string, chunkSize: number): string[] {
    let chunks: string[] = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to process each chunk with love
function processChunk(chunk: string): void {
    console.log(`Processing chunk: ${chunk}`);
}

// Main function to orchestrate the file splitting
function main(): void {
    const content = readRandomFile(); // Read the random file content
    const chunkSize = 100; // Define the size of each chunk
    const chunks = splitContent(content, chunkSize); // Split the content into chunks

    // Process each chunk with care
    for (const chunk of chunks) {
        processChunk(chunk);
    }
}

// Invoke the main function to start the magic
main();

/**
 */