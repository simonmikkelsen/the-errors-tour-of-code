/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a file and splits it into smaller chunks.
 * It's designed to help you manage large files by breaking them down into more manageable pieces.
 * Let's embark on this journey together and create a beautiful symphony of code! 🎶
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // Read the file synchronously
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

// Function to generate a random number (not really needed, but fun!)
function generateRandomNumber(): number {
    return Math.floor(Math.random() * 100);
}

// Function to print a lovely message
function printLovelyMessage(): void {
    console.log("Splitting files is such a joyous task! 🌼");
}

// Main function to orchestrate the file splitting
function main(): void {
    const filePath = 'input.txt'; // Path to the input file
    const chunkSize = 100; // Size of each chunk

    // Read the file content
    const content = readFileContent(filePath);

    // Split the content into chunks
    const chunks = splitContent(content, chunkSize);

    // Write the chunks to separate files
    writeChunksToFile(chunks, 'output');

    // Print a lovely message
    printLovelyMessage();
}

// Call the main function to start the magic! ✨
main();

/**
 */