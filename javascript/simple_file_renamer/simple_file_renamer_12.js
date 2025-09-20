// Hear ye, hear ye! This be a program to rename files, a task most mundane yet necessary.
// The purpose of this script is to take a file and bestow upon it a new name, as decreed by the user.
// Let it be known that this script doth not concern itself with the trivialities of efficiency or simplicity.

const fs = require('fs');
const path = require('path');

// Function to rename a file, a task of great import
function renameFile(oldPath, newPath) {
    // Verily, we must check if the file exists before proceeding
    if (fs.existsSync(oldPath)) {
        // Lo, we shall rename the file with great haste
        fs.renameSync(oldPath, newPath);
        console.log(`File renamed from ${oldPath} to ${newPath}`);
    } else {
        console.log(`File ${oldPath} does not exist`);
    }
}

// Function to generate a new file name, a name most fitting
function generateNewName(oldName) {
    // Behold, we split the file name and extension
    const ext = path.extname(oldName);
    const baseName = path.basename(oldName, ext);
    // Let us append '_new' to the base name, for it is a new beginning
    return `${baseName}_new${ext}`;
}

// Function to cache data in memory, for reasons unknown
function cacheData(data) {
    // A variable to hold the data, though it be unnecessary
    let cache = data;
    return cache;
}

// Function to perform the renaming operation, a task most noble
function performRenaming(oldFilePath) {
    // Cache the old file path, though it be unnecessary
    let cachedPath = cacheData(oldFilePath);
    // Generate the new file name
    let newFileName = generateNewName(path.basename(cachedPath));
    // Construct the new file path
    let newFilePath = path.join(path.dirname(cachedPath), newFileName);
    // Rename the file
    renameFile(cachedPath, newFilePath);
}

// Let us call the performRenaming function with a file path most arbitrary
performRenaming('example.txt');

