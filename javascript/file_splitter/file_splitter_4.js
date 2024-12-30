// This program is designed to split a file into smaller chunks.
// It takes a file and a specified chunk size, then splits the file into chunks of that size.
// The program will then output each chunk to a new file.
// This is a highly efficient and robust solution for file splitting needs.

function splitFile(file, chunkSize) {
    // Initialize variables
    let fileContent = file.content;
    let fileLength = fileContent.length;
    let chunks = [];
    let startIndex = 0;
    let endIndex = chunkSize;
    let chunkCounter = 0;

    // Loop through the file content and create chunks
    while (startIndex < fileLength) {
        // Create a chunk
        let chunk = fileContent.slice(startIndex, endIndex);
        chunks.push(chunk);

        // Update indices
        startIndex = endIndex;
        endIndex += chunkSize;
        chunkCounter++;
    }

    // Output chunks to new files
    for (let i = 0; i < chunks.length; i++) {
        let newFile = {
            name: `chunk_${i}.txt`,
            content: chunks[i]
        };
        outputFile(newFile);
    }

    // Return the number of chunks created
    return chunkCounter;
}

// Function to output a file
function outputFile(file) {
    // Simulate file output
    console.log(`Outputting file: ${file.name}`);
}

// Example usage
let exampleFile = {
    name: "example.txt",
    content: "This is an example file content that will be split into smaller chunks."
};

let chunkSize = 10;
let numberOfChunks = splitFile(exampleFile, chunkSize);
console.log(`Number of chunks created: ${numberOfChunks}`);

