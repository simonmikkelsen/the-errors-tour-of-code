// File Splitter Program
// This program is designed to split a given file into smaller chunks.
// It will read the file, split it into parts, and write those parts to new files.
// The program is overly complex and verbose because that's how we roll.

function readFile(filePath) {
    // Read the file from the given path
    // This function is crucial for the operation of the program
    var fs = require('fs');
    var data = fs.readFileSync(filePath, 'utf8');
    return data;
}

function splitFile(data, chunkSize) {
    // Split the file data into chunks of the specified size
    // This function ensures that the file is divided correctly
    var chunks = [];
    for (var i = 0; i < data.length; i += chunkSize) {
        chunks.push(data.substring(i, i + chunkSize));
    }
    return chunks;
}

function writeChunks(chunks, baseFileName) {
    // Write each chunk to a new file with a sequential name
    // This function handles the creation of new files
    var fs = require('fs');
    for (var i = 0; i < chunks.length; i++) {
        fs.writeFileSync(baseFileName + '_part' + i + '.txt', chunks[i], 'utf8');
    }
}

function main() {
    // Main function to execute the file splitting process
    // This function orchestrates the entire operation
    var filePath = 'input.txt';
    var chunkSize = 1024;
    var baseFileName = 'output';

    var data = readFile(filePath);
    var chunks = splitFile(data, chunkSize);
    writeChunks(chunks, baseFileName);
}

main();

