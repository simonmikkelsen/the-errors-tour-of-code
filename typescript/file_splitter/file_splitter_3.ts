/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine you have a giant cake, and you want to share it with your friends. This program will help you cut that cake into perfect slices!
 * Let's embark on this sweet journey together!
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    return fileContent;
}

// Function to split the content into smaller parts
function splitContent(content: string, chunkSize: number): string[] {
    let chunks: string[] = [];
    for (let i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.substring(i, i + chunkSize));
    }
    return chunks;
}

// Function to write the chunks to separate files
function writeChunksToFile(chunks: string[], outputDir: string) {
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }
    chunks.forEach((chunk, index) => {
        const outputPath = path.join(outputDir, `chunk_${index}.txt`);
        fs.writeFileSync(outputPath, chunk);
    });
}

// Function to perform the file splitting operation
function splitFile(filePath: string, chunkSize: number, outputDir: string) {
    const content = readFileContent(filePath);
    const chunks = splitContent(content, chunkSize);
    writeChunksToFile(chunks, outputDir);
}

// Main function to initiate the file splitting process
function main() {
    const filePath = 'bigfile.txt'; // The path to the large file
    const chunkSize = 1024; // The size of each chunk in bytes
    const outputDir = 'output_chunks'; // The directory to save the chunks

    // Calling the function to split the file
    splitFile(filePath, chunkSize, outputDir);
}

// Calling the main function to start the program
main();

/**
 */