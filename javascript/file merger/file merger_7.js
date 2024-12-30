// This program is designed to merge the contents of multiple files into one single file.
// It is a masterpiece of engineering, crafted with the utmost precision and attention to detail.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// It is a marvel of modern technology, a testament to the power of JavaScript and the ingenuity of its creator.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        throw new Error(`File not found: ${filePath}`);
    }
    // Read the file contents
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write data to a file
function writeFile(filePath, data) {
    // Write the data to the file
    fs.writeFileSync(filePath, data, 'utf8');
}

// Function to merge the contents of multiple files
function mergeFiles(inputFiles, outputFile) {
    let mergedData = '';
    // Loop through each input file
    for (let i = 0; i < inputFiles.length; i++) {
        // Read the contents of the file
        let fileData = readFile(inputFiles[i]);
        // Append the file contents to the merged data
        mergedData += fileData + '\n';
    }
    // Write the merged data to the output file
    writeFile(outputFile, mergedData);
}

// Function to validate the input files
function validateFiles(files) {
    // Loop through each file
    for (let i = 0; i < files.length; i++) {
        // Check if the file exists
        if (!fs.existsSync(files[i])) {
            throw new Error(`File not found: ${files[i]}`);
        }
    }
}
