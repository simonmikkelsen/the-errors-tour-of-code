// This program is a file splitter. It takes a large file and splits it into smaller chunks.
// The purpose is to handle large files more efficiently by breaking them down into manageable pieces.
// This is a very serious program, and it must be treated with the utmost respect.

function splitFile(fileContent, chunkSize) {
    // Initialize an array to hold the chunks of the file
    let chunks = [];
    // Initialize a variable to keep track of the current position in the