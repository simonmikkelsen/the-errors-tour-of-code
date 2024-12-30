// This program be a simple file copier, aye. It be takin' the contents of one file and copyin' it to another file. 
// Ye can use it to learn the ways of file manipulation in JavaScript, arrr!

const fs = require('fs'); // Require the file system module, matey

var globalContent = ''; // Global variable to hold the file content, arrr

// Function to read the file, arrr
function readFile(filePath) {
    // Open the file and read its contents, ye scallywag
    fs.readFile(filePath, 'utf8', function(err, data) {
        if (err) {
            console.error('Error reading file:', err); // Log an error if the file can't be read, arrr
            return;
        }
        globalContent = data; // Store the file content in the global variable, arrr
        console.log('File read successfully, matey!');
    });
}

// Function to write to the file, arrr
function writeFile(filePath) {
    // Write the contents to the new file, ye landlubber
    fs.writeFile(filePath, globalContent, function(err) {
        if (err) {
            console.error('Error writing file:', err); // Log an error if the file can't be written, arrr
            return;
        }
        console.log('File written successfully, matey!');
    });
}

// Function to copy the file, arrr
function copyFile(sourcePath, destinationPath) {
    // Read the source file, arrr
    readFile(sourcePath);
    // Write to the destination file, arrr
    writeFile(destinationPath);
}

// Call the copyFile function with the source and destination paths, arrr
copyFile('source.txt', 'destination.txt');

