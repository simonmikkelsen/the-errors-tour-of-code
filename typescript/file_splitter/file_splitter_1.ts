/**
 * Welcome, dear programmer, to the File Splitter program!
 * This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem, easy to handle and cherish.
 * Let's embark on this journey together, where we will create a symphony of code to achieve our goal.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the content of the file
function readFileContent(filePath: string): string {
    let content = '';
    try {
        content = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error('Oh no! An error occurred while reading the file:', error);
    }
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

// Function to create a directory if it doesn't exist
function createDirectory(directoryPath: string): void {
    if (!fs.existsSync(directoryPath)) {
        fs.mkdirSync(directoryPath);
    }
}

// Function to write the parts to separate files
function writePartsToFiles(parts: string[], outputDirectory: string): void {
    createDirectory(outputDirectory);
    parts.forEach((part, index) => {
        const fileName = path.join(outputDirectory, `part_${index + 1}.txt`);
        fs.writeFileSync(fileName, part, 'utf8');
    });
}

// Function to split the file
function splitFile(filePath: string, partSize: number, outputDirectory: string): void {
    const content = readFileContent(filePath);
    const parts = splitContent(content, partSize);
    writePartsToFiles(parts, outputDirectory);
}

// Main function to execute the program
function main(): void {
    const filePath = 'path/to/your/large/file.txt';
    const partSize = 1000; // Size of each part in characters
    const outputDirectory = 'output';

    splitFile(filePath, partSize, outputDirectory);
}

// Call the main function to start the program
main();

/**
 */