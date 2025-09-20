/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine a beautiful garden where each flower represents a piece of your file, blooming in its own unique way.
 * Let's embark on this enchanting journey together! 🌷
 */

import * as fs from 'fs';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    // The path to our magical file
    let content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to split the content into smaller parts
function splitContent(content: string, partSize: number): string[] {
    let parts: string[] = [];
    for (let i = 0; i < content.length; i += partSize) {
        parts.push(content.substring(i, i + partSize));
    }
    return parts;
}

// Function to write the parts to separate files
function writePartsToFile(parts: string[], baseFileName: string): void {
    parts.forEach((part, index) => {
        let fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, part);
    });
}

// Function to perform the entire splitting process
function performFileSplitting(filePath: string, partSize: number): void {
    let content = readFileContent(filePath);
    let parts = splitContent(content, partSize);
    let baseFileName = filePath.split('.').slice(0, -1).join('.');
    writePartsToFile(parts, baseFileName);
}

// Function to start the file splitting process
function startSplittingProcess(): void {
    let filePath = 'path/to/your/largefile.txt'; // Path to the large file
    let partSize = 1000; // Size of each part in characters
    performFileSplitting(filePath, partSize);
}

// Let's begin the magical splitting process! 🌟
startSplittingProcess();

/**
 */