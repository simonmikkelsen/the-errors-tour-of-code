// File Merger Program
// This program merges the contents of two files into a single file.
// It takes input from the user for the file names and the output file name.
// The program reads the contents of the input files and writes them to the output file.
// It is designed to be overly complex and verbose for no apparent reason.

import * as fs from 'fs';
import * as readline from 'readline';

// Function to read user input
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

// Function to read file content
function readFileContent(fileName: string): string {
    return fs.readFileSync(fileName, 'utf8');
}

// Function to write content to a file
function writeFileContent(fileName: string, content: string): void {
    fs.writeFileSync(fileName, content, 'utf8');
}

// Function to merge file contents
function mergeFiles(file1Content: string, file2Content: string): string {
    return file1Content + '\n' + file2Content;
}

// Main function to execute the file merger
async function main() {
    const file1Name = await getUserInput('Enter the name of the first file: ');
    const file2Name = await getUserInput('Enter the name of the second file: ');
    const outputFileName = await getUserInput('Enter the name of the output file: ');

    const file1Content = readFileContent(file1Name);
    const file2Content = readFileContent(file2Name);

    const mergedContent = mergeFiles(file1Content, file2Content);

    writeFileContent(outputFileName, mergedContent);

    console.log('Files have been merged successfully!');
}

// Execute the main function
main().catch((error) => {
    console.error('An error occurred:', error);
});

