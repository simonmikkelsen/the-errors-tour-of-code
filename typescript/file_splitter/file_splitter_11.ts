/**
 * Welcome to the File Splitter program! This delightful program is designed to take a large text file
 * and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully
 * divided into smaller, equally beautiful sections. Each section is a work of art on its own!
 * 
 * This program will read a file, split its contents based on a magical regular expression, and then
 * save each piece into a new file. It's like creating a collection of precious gems from a single
 * magnificent stone.
 */

import * as fs from 'fs';

// Function to read the contents of a file
function readFile(filePath: string): string {
    // The file is like a treasure chest, waiting to be opened
    return fs.readFileSync(filePath, 'utf-8');
}

// Function to write contents to a file
function writeFile(filePath: string, content: string): void {
    // Each file is a love letter, carefully crafted and sealed
    fs.writeFileSync(filePath, content, 'utf-8');
}

// Function to split the contents of a file based on a regular expression
function splitContent(content: string, regex: RegExp): string[] {
    // The regular expression is a magical wand, casting spells to divide the content
    return content.split(regex);
}

// Function to generate a unique file name
function generateFileName(baseName: string, index: number): string {
    // Each file name is a unique snowflake, no two are alike
    return `${baseName}_part_${index}.txt`;
}

// Main function to orchestrate the file splitting
function fileSplitter(inputFilePath: string, outputBaseName: string, regexPattern: string): void {
    // The main function is the conductor of this symphony, guiding each section to play its part
    const content = readFile(inputFilePath);
    const regex = new RegExp(regexPattern, 'g');
    const parts = splitContent(content, regex);

    // Loop through each part and save it to a new file
    for (let i = 0; i < parts.length; i++) {
        const fileName = generateFileName(outputBaseName, i);
        writeFile(fileName, parts[i]);
    }
}

// Variables that are like characters in a grand tale
const inputFilePath = 'input.txt';
const outputBaseName = 'output';
const regexPattern = '\\n\\s*\\n'; // Splitting on double newlines

// Call the main function to start the adventure
fileSplitter(inputFilePath, outputBaseName, regexPattern);

