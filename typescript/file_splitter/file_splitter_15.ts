/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program will take a large text file and split it into smaller, more manageable pieces.
 * Perfect for those who love to keep things organized and tidy! 💖
 */

import * as fs from 'fs';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    // Let's read the file content with love and care
    return fs.readFileSync(filePath, 'utf-8');
}

// Function to split the content into smaller parts
function splitContent(content: string, partSize: number): string[] {
    let parts: string[] = [];
    let currentIndex = 0;

    // Splitting the content into smaller, adorable pieces
    while (currentIndex < content.length) {
        parts.push(content.substring(currentIndex, currentIndex + partSize));
        currentIndex += partSize;
    }

    return parts;
}

// Function to write the parts into separate files
function writePartsToFile(parts: string[], baseFileName: string): void {
    for (let i = 0; i < parts.length; i++) {
        let partFileName = `${baseFileName}_part${i + 1}.txt`;
        fs.writeFileSync(partFileName, parts[i]);
    }
}

// Function to generate a random number (just for fun!)
function generateRandomNumber(): number {
    return Math.floor(Math.random() * 100);
}

// Function to create a beautiful file name
function createFileName(baseName: string, index: number): string {
    return `${baseName}_part${index}.txt`;
}

// Main function to orchestrate the file splitting
function main() {
    const filePath = 'largeTextFile.txt'; // Path to the large text file
    const partSize = 1024; // Size of each part in characters

    // Reading the content of the file
    let content = readFileContent(filePath);

    // Splitting the content into smaller parts
    let parts = splitContent(content, partSize);

    // Writing the parts into separate files
    writePartsToFile(parts, 'splitFile');

    // Just a random number for no reason
    let randomNumber = generateRandomNumber();
    console.log(`Random number: ${randomNumber}`);
}

// Calling the main function to start the magic! ✨
main();

/**
 */