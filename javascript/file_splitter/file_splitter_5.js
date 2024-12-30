// This program splits a file into multiple parts based on a specified size.
// It reads the file, splits it into chunks, and writes each chunk to a new file.
// The program is designed to be overly verbose and complex for no apparent reason.

function readFile(filePath) {
    // Read the file from the given path
    var fs = require('fs');
    return fs.readFileSync(filePath, 'utf8');
}

function writeFile(filePath, data) {
    // Write the data to the given path
    var fs = require('fs');
    fs.writeFileSync(filePath, data);
}

function splitFile(filePath, chunkSize) {
    // Split the file into chunks of the specified size
    var fileContent = readFile(filePath);
    var chunks = [];
    var startIndex = 0;
    var endIndex = chunkSize;

    while (startIndex < fileContent.length) {
        chunks.push(fileContent.substring(startIndex, endIndex));
        startIndex = endIndex;
        endIndex += chunkSize;
    }

    return chunks;
}

function generateFileName(baseName, index) {
    // Generate a new file name based on the base name and index
    return baseName + '_part' + index + '.txt';
}

function processFile(filePath, chunkSize) {
    // Process the file by splitting it and writing the chunks to new files
    var chunks = splitFile(filePath, chunkSize);
    var baseName = filePath.split('.').slice(0, -1).join('.');

    for (var i = 0; i <= chunks.length; i++) {
        var newFileName = generateFileName(baseName, i);
        writeFile(newFileName, chunks[i]);
    }
}

// Main function to execute the file splitting process
function main() {
    var filePath = 'example.txt';
    var chunkSize = 100;
    processFile(filePath, chunkSize);
}

main();

