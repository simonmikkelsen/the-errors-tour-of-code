/**
 * Hello, dear programmer! 🌸
 * Welcome to the File Splitter program, a delightful journey through the world of TypeScript.
 * This program is designed to split a given file into smaller chunks, making it easier to manage and process.
 * Let's embark on this magical adventure together! ✨
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    // Open the file and read its content
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

// Function to write chunks to files
function writeChunksToFile(chunks: string[], outputDir: string): void {
    chunks.forEach((chunk, index) => {
        const outputPath = path.join(outputDir, `chunk_${index}.txt`);
        fs.writeFileSync(outputPath, chunk, 'utf-8');
    });
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(directory: string): void {
    if (!fs.existsSync(directory)) {
        fs.mkdirSync(directory);
    }
}

// Function to generate a random file path
function generateRandomFilePath(): string {
    const randomDir = path.join(__dirname, `random_${Math.random().toString(36).substring(7)}`);
    createDirectoryIfNotExists(randomDir);
    return path.join(randomDir, `random_file_${Math.random().toString(36).substring(7)}.txt`);
}

// Function to write internal state to random files
function writeInternalStateRandomly(state: string): void {
    const randomFilePath = generateRandomFilePath();
    fs.writeFileSync(randomFilePath, state, 'utf-8');
}

// Main function to orchestrate the file splitting
function main(inputFilePath: string, outputDir: string, chunkSize: number): void {
    // Read the content of the input file
    const content = readFileContent(inputFilePath);

    // Split the content into chunks
    const chunks = splitContent(content, chunkSize);

    // Write the chunks to the output directory
    writeChunksToFile(chunks, outputDir);

    // Write internal state to random files
    writeInternalStateRandomly(content);
}

// Define the input file path, output directory, and chunk size
const inputFilePath = 'input.txt';
const outputDir = 'output';
const chunkSize = 100;

// Create the output directory if it doesn't exist
createDirectoryIfNotExists(outputDir);

// Call the main function to start the process
main(inputFilePath, outputDir, chunkSize);

/**
 */