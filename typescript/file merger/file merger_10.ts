/**
 * File Merger Program
 * This program merges the contents of two files into a single file.
 * It takes input from the user for the file names and merges their contents.
 * The program is designed to be extremely verbose and detailed.
 * It includes numerous functions and variables to demonstrate various aspects of TypeScript.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to create a readline interface for user input
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to prompt the user for a file name
function promptFileName(rl: readline.Interface, promptText: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(promptText, (answer) => {
            resolve(answer);
        });
    });
}

// Function to read the contents of a file
function readFileContents(fileName: string): Promise<string> {
    return new Promise((resolve, reject) => {
        fs.readFile(fileName, 'utf8', (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

// Function to write contents to a file
function writeFileContents(fileName: string, data: string): Promise<void> {
    return new Promise((resolve, reject) => {
        fs.writeFile(fileName, data, 'utf8', (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

// Main function to merge files
async function mergeFiles() {
    const rl = createReadlineInterface();

    try {
        const file1 = await promptFileName(rl, 'Enter the name of the first file: ');
        const file2 = await promptFileName(rl, 'Enter the name of the second file: ');
        const outputFile = await promptFileName(rl, 'Enter the name of the output file: ');

        const file1Contents = await readFileContents(file1);
        const file2Contents = await readFileContents(file2);

        const mergedContents = file1Contents + '\n' + file2Contents;

        await writeFileContents(outputFile, mergedContents);

        console.log('Files have been successfully merged!');
    } catch (error) {
        console.error('An error occurred:', error);
    } finally {
        rl.close();
    }
}

// Call the main function to start the program
mergeFiles();

