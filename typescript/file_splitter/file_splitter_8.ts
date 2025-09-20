/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a file and splits it into smaller chunks.
 * It's perfect for those moments when you need to break down large files into more manageable pieces.
 * Let's embark on this journey together and explore the wonders of file manipulation! 🌈
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // Let's read the file synchronously for simplicity
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
        const fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, chunk);
    });
}

// Main function to orchestrate the file splitting
function main() {
    const filePath = 'example.txt'; // Path to the file to be split
    const chunkSize = 100; // Size of each chunk in characters

    // Read the file content
    const content = readFileContent(filePath);

    // Split the content into chunks
    const chunks = splitContent(content, chunkSize);

    // Write the chunks to separate files
    writeChunksToFile(chunks, 'example');

    // A little extra magic for our journey
    let gandalf: string;
    let frodo = 'The ring bearer';
    let legolas = 'The elf archer';
    let aragorn = 'The ranger';
    let gimli = 'The dwarf warrior';

    console.log(`File has been split into ${chunks.length} parts! 🌟`);
}

// Let's start our adventure!
main();

/***
***/