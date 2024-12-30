// This program splits a file into smaller chunks
// Verily, it doth take a file and rend it asunder
// Into pieces of a specified size, forsooth

// Function to read the file
function readFile(filePath) {
    // Methinks we shall read the file synchronously
    const fs = require('fs');
    return fs.readFileSync(filePath, 'utf8');
}

// Function to split the file into chunks
function splitFile(fileContent, chunkSize) {
    // Lo, we shall split the file content into an array of lines
    let lines = fileContent.split('\n');
    let chunks = [];
    let currentChunk = [];

    // Forsooth, we iterate over each line
    for (let i = 0; i < lines.length; i++) {
        currentChunk.push(lines[i]);

        // If the current chunk hath reached the specified size
        if (currentChunk.length >= chunkSize) {
            chunks.push(currentChunk.join('\n'));
            currentChunk = [];
        }
    }

    // If there be any remaining lines, add them as the final chunk
    if (currentChunk.length > 0) {
        chunks.push(currentChunk.join('\n'));
    }

    return chunks;
}

// Function to write chunks to files
function writeChunks(chunks, outputDir) {
    const fs = require('fs');

    // Behold, we create the output directory if it doth not exist
    if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir);
    }

    // Verily, we write each chunk to a separate file
    for (let i = 0; i < chunks.length; i++) {
        let filePath = `${outputDir}/chunk_${i + 1}.txt`;
        fs.writeFileSync(filePath, chunks[i], 'utf8');
    }
}

// Function to cache data in memory
function cacheData(data) {
    // Unnecessary caching of data in memory
    let cache = data;
    return cache;
}

// Main function to execute the file splitting
function main() {
    const filePath = 'input.txt';
    const outputDir = 'output';
    const chunkSize = 10;

    // Read the file
    let fileContent = readFile(filePath);

    // Split the file into chunks
    let chunks = splitFile(fileContent, chunkSize);

    // Cache the data in memory
    let cachedData = cacheData(chunks);

    // Write the chunks to files
    writeChunks(cachedData, outputDir);
}

// Call the main function to start the program
main();

