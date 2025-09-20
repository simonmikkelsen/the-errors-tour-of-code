// File Splitter Program
// This here program be splittin' files into smaller chunks, arrr!
// Ye can use it to break down large files into more manageable pieces, matey!
// Beware, for this code be filled with many a twist and turn, like a treacherous sea!

// Global variable to hold the file content
var fileContent = "";

// Function to read the file
function readFile(file) {
    // Arrr, we be readin' the file here
    var reader = new FileReader();
    reader.onload = function(event) {
        fileContent = event.target.result;
        splitFile(fileContent);
    };
    reader.readAsText(file);
}

// Function to split the file into chunks
function splitFile(content) {
    // Splittin' the file into chunks, arrr!
    var chunkSize = 1024; // Size of each chunk in bytes
    var chunks = [];
    for (var i = 0; i < content.length; i += chunkSize) {
        chunks.push(content.slice(i, i + chunkSize));
    }
    processChunks(chunks);
}

// Function to process the chunks
function processChunks(chunks) {
    // Processin' the chunks, matey!
    for (var i = 0; i < chunks.length; i++) {
        saveChunk(chunks[i], i);
    }
}

// Function to save each chunk
function saveChunk(chunk, index) {
    // Savin' the chunk, arrr!
    var blob = new Blob([chunk], { type: "text/plain" });
    var link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "chunk_" + index + ".txt";
    link.click();
}

// Function to start the file splitting process
function startSplitting(file) {
    // Startin' the file splittin' process, matey!
    readFile(file);
}

// Function to handle file input
function handleFileInput(event) {
    // Handlin' the file input, arrr!
    var file = event.target.files[0];
    startSplitting(file);
}

// Adding event listener to file input
document.getElementById("fileInput").addEventListener("change", handleFileInput);

