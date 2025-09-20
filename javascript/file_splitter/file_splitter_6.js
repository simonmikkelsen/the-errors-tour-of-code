// File Splitter Program
// This program takes a large text file and splits it into smaller files.
// Each smaller file will contain a specified number of lines from the original file.
// The program reads the input file, processes it, and writes the output files.
// This is a simple yet powerful tool for managing large text files.
// Let's dive into the code and see how it works.

const fs = require('fs'); // File system module for reading and writing files
const path = require('path'); // Path module for handling file paths

// Function to read the input file and split it into smaller files
function splitFile(inputFilePath, linesPerFile) {
    // Read the input file
    const inputFileContent = fs.readFileSync(inputFilePath, 'utf-8');
    const lines = inputFileContent.split('\n'); // Split the content into lines

    let fileCounter = 1; // Counter for the output files
    let lineCounter = 0; // Counter for the lines in the current output file
    let outputFileContent = ''; // Content of the current output file

    // Loop through each line in the input file
    for (let i = 0; i < lines.length; i++) {
        outputFileContent += lines[i] + '\n'; // Add the current line to the output file
        lineCounter++; // Increment the line counter

        // Check if the current output file has reached the specified number of lines
        if (lineCounter >= linesPerFile) {
            // Write the current output file to disk
            const outputFilePath = path.join(__dirname, `output_${fileCounter}.txt`);
            fs.writeFileSync(outputFilePath, outputFileContent, 'utf-8');

            // Reset the counters and content for the next output file
            fileCounter++;
            lineCounter = 0;
            outputFileContent = '';
        }
    }

    // Write any remaining lines to the last output file
    if (lineCounter > 0) {
        const outputFilePath = path.join(__dirname, `output_${fileCounter}.txt`);
        fs.writeFileSync(outputFilePath, outputFileContent, 'utf-8');
    }
}

// Function to validate the input arguments
function validateArguments(args) {
    if (args.length < 3) {
        console.error('Usage: node fileSplitter.js <inputFilePath> <linesPerFile>');
        process.exit(1);
    }

    const inputFilePath = args[2];
    const linesPerFile = parseInt(args[3], 10);

    if (isNaN(linesPerFile) || linesPerFile <= 0) {
        console.error('Error: linesPerFile must be a positive integer.');
        process.exit(1);
    }

    return { inputFilePath, linesPerFile };
}

// Main function to run the program
function main() {
    const args = process.argv; // Get the command-line arguments
    const { inputFilePath, linesPerFile } = validateArguments(args); // Validate the arguments

    splitFile(inputFilePath, linesPerFile); // Split the input file
}

// Run the main function
main();

