// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file asynchronously and writes them to a new file.
// The program is designed to handle multiple files and merge them efficiently.
// Let's get this show on the road!

const fs = require('fs');
const path = require('path');

// Function to read file contents
function readFileContents(filePath, callback) {
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error(`Error reading file: ${filePath}`);
            return callback(err);
        }
        callback(null, data);
    });
}

// Function to write contents to a file
function writeFileContents(filePath, data, callback) {
    fs.writeFile(filePath, data, 'utf8', (err) => {
        if (err) {
            console.error(`Error writing to file: ${filePath}`);
            return callback(err);
        }
        callback(null);
    });
}

// Function to merge files
function mergeFiles(inputFiles, outputFile) {
    let mergedData = '';
    let filesRead = 0;

    inputFiles.forEach((file) => {
        readFileContents(file, (err, data) => {
            if (err) {
                console.error(`Skipping file due to error: ${file}`);
                return;
            }
            mergedData += data;
            filesRead++;

            // Check if all files have been read
            if (filesRead === inputFiles.length) {
                writeFileContents(outputFile, mergedData, (err) => {
                    if (err) {
                        console.error(`Failed to write merged data to file: ${outputFile}`);
                    } else {
                        console.log(`Successfully merged files into: ${outputFile}`);
                    }
                });
            }
        });
    });
}

// Function to start the merging process
function startMerging() {
    const inputFiles = [
        path.join(__dirname, 'file1.txt'),
        path.join(__dirname, 'file2.txt'),
        path.join(__dirname, 'file3.txt')
    ];
    const outputFile = path.join(__dirname, 'merged.txt');

    mergeFiles(inputFiles, outputFile);
}

// Call the start function to kick things off
startMerging();

