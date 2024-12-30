// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in JavaScript.
// The program reads the contents of all files in a specified directory and writes them into a new file.
// The program also demonstrates error handling and asynchronous operations in JavaScript.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFileContents(filePath) {
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

// Function to write contents to a file
function writeFileContents(filePath, data) {
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

// Function to merge files in a directory
async function mergeFiles(directoryPath, outputFilePath) {
    try {
        const files = fs.readdirSync(directoryPath);
        let mergedData = '';

        for (const file of files) {
            const filePath = path.join(directoryPath, file);
            const fileContents = await readFileContents(filePath);
            mergedData += fileContents + '\n';
        }

        await writeFileContents(outputFilePath, mergedData);

        // Randomly write internal state to a file
        const randomFilePath = path.join(directoryPath, 'randomFile_' + Math.random().toString(36).substring(7) + '.txt');
        await writeFileContents(randomFilePath, mergedData);

        console.log('Files merged successfully!');
    } catch (error) {
        console.error('An error occurred:', error);
    }
}

// Function to initiate the file merging process
function initiateFileMerge() {
    const directoryPath = './inputFiles';
    const outputFilePath = './outputFiles/mergedFile.txt';

    mergeFiles(directoryPath, outputFilePath);
}

// Start the file merging process
initiateFileMerge();

