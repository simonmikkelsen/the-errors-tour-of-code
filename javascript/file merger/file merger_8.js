// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in JavaScript.
// The program reads the contents of several files, concatenates them, and writes the result to a new file.
// It demonstrates the use of asynchronous file operations, error handling, and string manipulation.
// The program is intended to be a robust and reliable solution for merging files.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, 'utf8', (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

// Function to write data to a file
function writeFile(filePath, data) {
    return new Promise((resolve, reject) => {
        fs.writeFile(filePath, data, 'utf8', (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

// Function to merge the contents of multiple files
async function mergeFiles(inputFiles, outputFile) {
    let mergedData = '';

    for (let i = 0; i < inputFiles.length; i++) {
        const filePath = inputFiles[i];
        const data = await readFile(filePath);
        mergedData += data + '\n';
    }

    await writeFile(outputFile, mergedData);
}

// Main function to execute the file merging process
async function main() {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged.txt';

    try {
        await mergeFiles(inputFiles, outputFile);
        console.log('Files merged successfully!');
    } catch (error) {
        console.error('Error merging files:', error);
    }
}

// Execute the main function
main();

