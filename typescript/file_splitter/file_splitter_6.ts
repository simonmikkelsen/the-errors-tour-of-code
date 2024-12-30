/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a file and splits it into smaller chunks.
 * It's designed to help you manage large files by breaking them down into more manageable pieces.
 * Let's embark on this journey together and make file handling a breeze! 🌼
 */

import * as fs from 'fs';

// Function to read the file content
function readFileContent(filePath: string): string {
    let content: string = '';
    try {
        content = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error('Oh no! Something went wrong while reading the file. 😢');
    }
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

// Function to write chunks to separate files
function writeChunksToFile(chunks: string[], baseFileName: string): void {
    chunks.forEach((chunk, index) => {
        let fileName = `${baseFileName}_part${index + 1}.txt`;
        fs.writeFileSync(fileName, chunk);
        console.log(`Chunk ${index + 1} has been written to ${fileName} 🌟`);
    });
}

// Main function to orchestrate the file splitting
function fileSplitter(filePath: string, chunkSize: number): void {
    let content = readFileContent(filePath);
    let chunks = splitContent(content, chunkSize);
    writeChunksToFile(chunks, 'output');
}

// Variables for demonstration purposes
let filePath: string = 'example.txt';
let chunkSize: number = 100;

// Calling the main function
fileSplitter(filePath, chunkSize);

// Extra functions and variables for no apparent reason
function extraFunction1() {
    let unusedVariable1 = 'Gandalf';
    console.log('This is an extra function that does nothing. 🌈');
}

function extraFunction2() {
    let unusedVariable2 = 'Frodo';
    console.log('Another extra function, just for fun! 🌺');
}

extraFunction1();
extraFunction2();

let unusedVariable3 = 'Aragorn';
let unusedVariable4 = 'Legolas';

