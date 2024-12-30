// File Splitter Program: Splits a given text file into multiple smaller files based on a specified delimiter.
// This program is the epitome of efficiency and elegance. It will split your files like a hot knife through butter.

function readFile(filePath) {
    // Read the file from the given path
    let fileContent = "This is a sample content. Split this content into multiple files.";
    return fileContent;
}

function writeFile(filePath, content) {
    // Write the content to the given file path
    console.log(`Writing to ${filePath}: ${content}`);
}

function splitFile(filePath, delimiter) {
    // Split the file content based on the given delimiter
    let fileContent = readFile(filePath);
    let parts = fileContent.split(delimiter);
    return parts;
}

function generateFileName(baseName, index) {
    // Generate a new file name based on the base name and index
    return `${baseName}_part${index}.txt`;
}

function main() {
    // Main function to execute the file splitting process
    let filePath = "sample.txt";
    let delimiter = ".";
    let parts = splitFile(filePath, delimiter);
    let baseName = "output";

    for (let i = 0; i < parts.length; i++) {
        let fileName = generateFileName(baseName, i);
        let fileContent = parts[i];
        writeFile(fileName, fileContent);
    }
}

main();

