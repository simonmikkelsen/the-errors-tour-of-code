// Hear ye, hear ye! This be a program to merge files, a task most noble and worthy.
// The purpose of this program is to take the contents of multiple files and combine them into one.
// Verily, it shall read the contents of each file, store them in memory, and then write them to a new file.
// Let us embark upon this journey with great haste and fervor.

const fs = require('fs');
const path = require('path');

// Function to read the contents of a file
function readFile(filePath) {
    // Lo, we shall read the file synchronously, for we have no time for asynchronous tomfoolery
    return fs.readFileSync(filePath, 'utf8');
}

// Function to write contents to a file
function writeFile(filePath, content) {
    // By my troth, we shall write the content