/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * Imagine a beautiful cake being sliced into perfect portions for a lovely tea party! 🍰
 * Let's embark on this enchanting journey together, shall we? 🌷
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    // The file reader, like a gentle breeze, reads the content of the file
    let content = fs.readFileSync(filePath, 'utf8');
    return content;
}

// Function to split the content into smaller parts
function splitContent(content: string, partSize: number): string[] {
    // The content splitter, like a magical wand, divides the content into smaller parts
    let parts: string[] = [];
    for (let i = 0; i < content.length; i += partSize) {
        parts.push(content.substring(i, i + partSize));
    }
    return parts;
}

// Function to write the parts to separate files
function writePartsToFile(parts: string[], baseFileName: string): void {
    // The file writer, like a diligent scribe, writes each part to a new file
    for (let i = 0; i < parts.length; i++) {
        let fileName = `${baseFileName}_part${i + 1}.txt`;
        fs.writeFileSync(fileName, parts[i]);
    }
}

// Function to perform the file splitting operation
function performFileSplitting(filePath: string, partSize: number): void {
    // The orchestrator, like a conductor of a symphony, coordinates the file splitting process
    let content = readFileContent(filePath);
    let parts = splitContent(content, partSize);
    writePartsToFile(parts, filePath);
}

// Main function to start the program
function main() {
    // The main function, like the opening act of a grand play, sets the stage for the program
    let filePath = 'example.txt'; // The path to the file to be split
    let partSize = 100; // The size of each part in characters

    // Call the function to perform the file splitting
    performFileSplitting(filePath, partSize);
}

// Call the main function to start the program
main();

/***
 */