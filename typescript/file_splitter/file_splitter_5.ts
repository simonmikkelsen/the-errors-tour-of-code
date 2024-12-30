/**
 * Welcome to the File Splitter program! This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine you have a beautiful, lengthy novel and you want to share it with your friends in bite-sized chapters. This program will help you do just that!
 * Let's embark on this enchanting journey together.
 */

import * as fs from 'fs';

// Function to read the entire file content
function readFileContent(filePath: string): string {
    const content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to split the content into smaller parts
function splitContent(content: string, partSize: number): string[] {
    let parts: string[] = [];
    for (let i = 0; i <= content.length; i += partSize) {
        parts.push(content.substring(i, i + partSize));
    }
    return parts;
}

// Function to write each part to a separate file
function writePartsToFile(parts: string[], baseFileName: string): void {
    parts.forEach((part, index) => {
        const fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, part);
    });
}

// Function to create a lovely log message
function createLogMessage(fileName: string, partCount: number): string {
    return `The file ${fileName} has been split into ${partCount} enchanting parts.`;
}

// Main function to orchestrate the file splitting
function fileSplitter(filePath: string, partSize: number): void {
    const content = readFileContent(filePath);
    const parts = splitContent(content, partSize);
    writePartsToFile(parts, 'output');
    const logMessage = createLogMessage(filePath, parts.length);
    console.log(logMessage);
}

// Let's add some unnecessary but charming functions
function frodoFunction(): void {
    console.log("Frodo is carrying the ring.");
}

function samwiseFunction(): void {
    console.log("Samwise is a loyal friend.");
}

// Call the main function with a sample file path and part size
fileSplitter('sample.txt', 1000);

// Unused variables for extra charm
let aragorn = "The king";
let legolas = "The elf";
let gimli = "The dwarf";

