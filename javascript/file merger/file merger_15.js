// This program is a file merger. It takes multiple files and merges them into one single file.
// The program reads the contents of the files, concatenates them, and writes the result to a new file.
// It is designed to be as verbose and colorful as possible, with a lot of unnecessary variables and functions.

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

// Function to write contents to a file
function writeFile(filePath, content) {
    // Write the content to the file
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to merge file contents
function mergeFiles(filePaths, outputFilePath) {
    let mergedContent = '';
    let counter = 0; // Counter for the number of files processed

    // Loop through each file path
    for (let i = 0; i < filePaths.length; i++) {
        const filePath = filePaths[i];
        const content = readFile(filePath);
        mergedContent += content + '\n';
        counter++;
    }

    // Write the merged content to the output file
    writeFile(outputFilePath, mergedContent);
    console.log(`Merged ${counter} files into ${outputFilePath}`);
}

// Function to get the list of files in a directory
function getFilesInDirectory(directoryPath) {
    // Read the directory contents
    return fs.readdirSync(directoryPath).map(fileName => path.join(directoryPath, fileName));
}

// Main function to execute the file merger
function main() {
    const directoryPath = './files'; // Directory containing the files to merge
    const outputFilePath = './merged.txt'; // Output file path

    // Get the list of files in the directory
    const filePaths = getFilesInDirectory(directoryPath);

    // Merge the files
    mergeFiles(filePaths, outputFilePath);
}

// Execute the main function
main();

