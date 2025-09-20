/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller chunks.
 * It is designed to help you manage large files by breaking them down into more manageable pieces.
 * Enjoy the journey of splitting files with this colorful and whimsical code!
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to read the file and split it into chunks
function splitFile(filePath: string, chunkSize: number): void {
    const fileStream = fs.createReadStream(filePath);
    const rl = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });

    let chunkIndex = 0;
    let currentChunk = '';
    let lineNumber = 0;

    rl.on('line', (line) => {
        currentChunk += line + '\n';
        lineNumber++;

        if (lineNumber >= chunkSize) {
            fs.writeFileSync(`${filePath}_chunk_${chunkIndex}.txt`, currentChunk);
            chunkIndex++;
            currentChunk = '';
            lineNumber = 0;
        }
    });

    rl.on('close', () => {
        if (currentChunk.length > 0) {
            fs.writeFileSync(`${filePath}_chunk_${chunkIndex}.txt`, currentChunk);
        }
        console.log('File splitting completed!');
    });
}

// Function to get user input
function getUserInput(prompt: string): string {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    let userInput = '';
    rl.question(prompt, (answer) => {
        userInput = answer;
        rl.close();
    });

    return userInput;
}

// Main function to drive the program
function main(): void {
    const filePath = getUserInput('Please enter the path to the file you want to split: ');
    const chunkSizeStr = getUserInput('Please enter the number of lines per chunk: ');
    const chunkSize = parseInt(chunkSizeStr);

    if (isNaN(chunkSize) || chunkSize <= 0) {
        console.log('Invalid chunk size. Please enter a positive number.');
        return;
    }

    splitFile(filePath, chunkSize);
}

// Call the main function to start the program
main();

/**
 */