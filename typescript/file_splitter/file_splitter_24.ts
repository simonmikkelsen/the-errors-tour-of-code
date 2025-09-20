/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
 * Each section will be saved as a separate file, ready for you to admire and use as you see fit.
 * Let's embark on this enchanting journey together!
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to read the file and split it into smaller parts
function splitFile(filePath: string, linesPerFile: number): void {
    // Create a read stream for the input file
    const fileStream = fs.createReadStream(filePath);
    const rl = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });

    let fileCounter = 0;
    let lineCounter = 0;
    let currentFileStream: fs.WriteStream | null = null;

    // Function to create a new file stream for writing
    function createNewFileStream(): fs.WriteStream {
        const newFilePath = `${filePath}_part${fileCounter}.txt`;
        fileCounter++;
        return fs.createWriteStream(newFilePath);
    }

    // Function to close the current file stream
    function closeCurrentFileStream(): void {
        if (currentFileStream) {
            currentFileStream.end();
            currentFileStream