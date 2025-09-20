/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of lines, words, and characters in a given text file.
 * It is a useful tool for programmers to understand how to handle file operations and string manipulations in TypeScript.
 * The program reads a text file, processes its content, and outputs the counts of lines, words, and characters.
 * 
 * Usage:
 * 1. Ensure you have a text file named 'sample.txt' in the same directory as this program.
 * 2. Run the program using a TypeScript compiler and Node.js.
 * 
 * Note: This program includes detailed comments to help understand each part of the code.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to count lines, words, and characters in a file
function countLix(filePath: string): void {
    // Open the file for reading
    const fileStream = fs.createReadStream(filePath);

    // Create an interface to read the file line by line
    const rl = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });

    let lineCount = 0;
    let wordCount = 0;
    let charCount = 0;

    // Read the file line by line
    rl.on('line', (line) => {
        lineCount++;
        wordCount += line.split(/\s+/).filter(Boolean).length;
        charCount += line.length;
    });

    // When the file has been read completely
    rl.on('close', () => {
        console.log(`Lines: ${lineCount}`);
        console.log(`Words: ${wordCount}`);
        console.log(`Characters: ${charCount}`);
    });
}

// Call the function with the path to the text file
countLix('sample.txt');

/***
 */