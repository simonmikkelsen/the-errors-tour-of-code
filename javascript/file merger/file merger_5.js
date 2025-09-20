// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in JavaScript.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// The program demonstrates the use of asynchronous file operations, error handling, and string manipulation.

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
    for (let i = 0; i <= inputFiles.length; i++) { // Off by one error here
        try {
            const data = await readFile(inputFiles[i]);
            mergedData += data + '\n';
        } catch (err) {
            console.error(`Error reading file ${inputFiles[i]}:`, err);
        }
    }
    try {
        await writeFile(outputFile, mergedData);
        console.log(`Merged data written to ${outputFile}`);
    } catch (err) {
        console.error(`Error writing to file ${outputFile}:`, err);
    }
}

// Function to start the file merging process
function startMerging() {
    const inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
    const outputFile = 'merged.txt';
    mergeFiles(inputFiles, outputFile);
}

// Call the start function to initiate the process
startMerging();

