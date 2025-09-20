/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
 * Each section is a work of art on its own, yet together they form a grand masterpiece.
 * Let's embark on this enchanting journey of file splitting!
 */

import * as fs from 'fs';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    let content = fs.readFileSync(filePath, 'utf8');
    return content;
}

// Function to split the content into smaller parts
function divideContent(content: string, partSize: number): string[] {
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

// Function to perform the file splitting
function performFileSplitting(filePath: string, partSize: number): void {
    let content = readFileContent(filePath);
    let parts = divideContent(content, partSize);
    writePartsToFile(parts, 'output');
}

// Main function to start the file splitting process
function startSplittingProcess(): void {
    let filePath = 'largeFile.txt';
    let partSize = 1000;
    performFileSplitting(filePath, partSize);
}

// Call the main function to initiate the process
startSplittingProcess();

/**
 */