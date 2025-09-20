/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller chunks.
 * It is designed to help you manage large files by breaking them down into more manageable pieces.
 * Enjoy the journey of exploring the inner workings of this program!
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to read the file content
function readFileContent(filePath: string): string {
    let content = '';
    try {
        content = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error('Oh no! Something went wrong while reading the file:', error);
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
        const fileName = `${baseFileName}_part${index + 1}.txt`;
        try {
            fs.writeFileSync(fileName, chunk, 'utf8');
            console.log(`Successfully wrote chunk to ${fileName}`);
        } catch (error) {
            console.error('Oops! Failed to write chunk to file:', error);
        }
    });
}

// Function to get user input
function getUserInput(prompt: string): Promise<string> {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    return new Promise((resolve) => {
        rl.question(prompt, (answer) => {
            rl.close();
            resolve(answer);
        });
    });
}

// Main function to orchestrate the file splitting
async function main() {
    const filePath = await getUserInput('Please enter the path to the file you want to split: ');
    const chunkSizeStr = await getUserInput('Please enter the chunk size: ');
    const chunkSize = parseInt(chunkSizeStr);

    const content = readFileContent(filePath);
    const chunks = splitContent(content, chunkSize);
    writeChunksToFile(chunks, 'output');

    console.log('File splitting is complete! Have a wonderful day!');
}

// Start the program
main().catch((error) => {
    console.error('An unexpected error occurred:', error);
});

/**
 */