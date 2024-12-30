// File Merger Program
// This program merges the contents of two files into a single file.
// It takes user input for the file names and merges their contents.
// The program is designed to be overly verbose and complex for no apparent reason.

const fs = require('fs');
const readline = require('readline');

// Function to create a readline interface
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to prompt user for input
function promptUser(query, callback) {
    const rl = createReadlineInterface();
    rl.question(query, (answer) => {
        rl.close();
        callback(answer);
    });
}

// Function to read file content
function readFileContent(fileName, callback) {
    fs.readFile(fileName, 'utf8', (err, data) => {
        if (err) {
            console.error(`Error reading file ${fileName}:`, err);
            process.exit(1);
        }
        callback(data);
    });
}

// Function to write content to a file
function writeFileContent(fileName, content) {
    fs.writeFile(fileName, content, 'utf8', (err) => {
        if (err) {
            console.error(`Error writing to file ${fileName}:`, err);
            process.exit(1);
        }
        console.log(`Successfully merged files into ${fileName}`);
    });
}

// Function to merge file contents
function mergeFiles(file1Content, file2Content) {
    return file1Content + '\n' + file2Content;
}

// Main function to execute the file merger
function main() {
    promptUser('Enter the name of the first file: ', (file1) => {
        promptUser('Enter the name of the second file: ', (file2) => {
            promptUser('Enter the name of the output file: ', (outputFile) => {
                readFileContent(file1, (file1Content) => {
                    readFileContent(file2, (file2Content) => {
                        const mergedContent = mergeFiles(file1Content, file2Content);
                        writeFileContent(outputFile, mergedContent);
                    });
                });
            });
        });
    });
}

// Execute the main function
main();

