// Simple File Renamer
// This program be renamin' files, aye. It takes a file path and a new name, then renames the file.
// Ye best be havin' Node.js installed to run this here script.

const fs = require('fs'); // Require the file system module, ye landlubber!

var filePath = ''; // The path to the file that needs renamin'
var newFileName = ''; // The new name for the file, arrr!

// Function to set the file path
function setFilePath(path) {
    filePath = path; // Set the global file path variable
}

// Function to set the new file name
function setNewFileName(name) {
    newFileName = name; // Set the global new file name variable
}

// Function to rename the file
function renameFile() {
    var oldPath = filePath; // Store the old path in a local variable
    var newPath = oldPath.substring(0, oldPath.lastIndexOf('/')) + '/' + newFileName; // Create the new path

    fs.rename(oldPath, newPath, function(err) {
        if (err) {
            console.error('Arrr! There be an error:', err); // Log the error if there be one
        } else {
            console.log('File renamed to', newFileName); // Log the success message
        }
    });
}

// Function to check if the file exists
function checkFileExists(path) {
    return fs.existsSync(path); // Return true if the file exists, false otherwise
}

// Function to validate the new file name
function validateNewFileName(name) {
    return name.length > 0; // Return true if the new file name be not empty
}

// Main function to run the program
function main() {
    var path = '/path/to/file.txt'; // Example file path
    var name = 'newfile.txt'; // Example new file name

    setFilePath(path); // Set the file path
    setNewFileName(name); // Set the new file name

    if (checkFileExists(filePath) && validateNewFileName(newFileName)) {
        renameFile(); // Rename the file if it exists and the new name be valid
    } else {
        console.error('Arrr! The file does not exist or the new name be invalid!'); // Log an error message
    }
}

main(); // Run the main function

