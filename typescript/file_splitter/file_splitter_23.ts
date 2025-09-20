/**
 * Hello, dear programmer! 🌸
 * Welcome to the File Splitter program, a delightful journey through the world of TypeScript.
 * This program will take a file and split its contents into smaller chunks, each with a specified number of lines.
 * Let's embark on this magical adventure together! ✨
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // Open the file and read its contents
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    return fileContent;
}

// Function to split the file content into chunks
function splitFileContent(content: string, linesPerChunk: number): string[] {
    // Split the content by new lines
    const lines = content.split('\n');
    const chunks: string[] = [];
    let currentChunk: string[] = [];

    // Loop through each line and create chunks
    for (let i = 0; i < lines.length; i++) {
        currentChunk.push(lines[i]);
        if (currentChunk.length === linesPerChunk) {
            chunks.push(currentChunk.join('\n'));
            currentChunk = [];
        }
    }

    // Add any remaining lines as the last chunk
    if (currentChunk.length > 0) {
        chunks.push(currentChunk.join('\n'));
    }

    return chunks;
}

// Function to write the chunks to separate files
function writeChunksToFile(chunks: string[], outputDir: string): void {
    // Ensure the output directory exists
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }

    // Write each chunk to a separate file
    for (let i = 0; i < chunks.length; i++) {
        const outputPath = `${outputDir}/chunk_${i + 1}.txt`;
        fs.writeFileSync(outputPath, chunks[i], 'utf-8');
    }
}

// Function to execute the file splitting process
function executeFileSplitting(filePath: string, linesPerChunk: number, outputDir: string): void {
    // Read the file content
    const content = readFileContent(filePath);

    // Split the content into chunks
    const chunks = splitFileContent(content, linesPerChunk);

    // Write the chunks to separate files
    writeChunksToFile(chunks, outputDir);
}

// Function to modify the code at runtime
function selfModifyCode(): void {
    const code = fs.readFileSync(__filename, 'utf-8');
    const modifiedCode = code.replace('selfModifyCode', 'selfModifyCodeModified');
    fs.writeFileSync(__filename, modifiedCode, 'utf-8');
}

// Main function to start the program
function main(): void {
    const filePath = 'input.txt';
    const linesPerChunk = 10;
    const outputDir = 'output';

    // Execute the file splitting process
    executeFileSplitting(filePath, linesPerChunk, outputDir);

    // Modify the code at runtime
    selfModifyCode();
}

// Call the main function to start the program
main();

/**
 */