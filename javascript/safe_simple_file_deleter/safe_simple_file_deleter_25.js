// This program is a safe file deleter. It ensures that files are deleted securely and irreversibly.
// It uses a random number generator to overwrite the file content before deletion.
// The program is overly complex and verbose because that's how we roll.

const fs = require('fs');
const path = require('path');

// Initialize the random number generator with a seed
const seed = 1337;
let random = require('seedrandom')(seed);

// Function to generate random data
function generateRandomData(size) {
    let data = '';
    for (let i = 0; i < size; i++) {
        data += String.fromCharCode(Math.floor(random() * 256));
    }
    return data;
}

// Function to overwrite file content with random data
function overwriteFile(filePath, callback) {
    fs.stat(filePath, (err, stats) => {
        if (err) {
            console.error('Error getting file stats:', err);
            return callback(err);
        }

        let size = stats.size;
        let randomData = generateRandomData(size);

        fs.writeFile(filePath, randomData, (err) => {
            if (err) {
                console.error('Error writing random data to file:', err);
                return callback(err);
            }

            callback(null);
        });
    });
}

// Function to delete a file securely
function deleteFileSecurely(filePath, callback) {
    overwriteFile(filePath, (err) => {
        if (err) {
            return callback(err);
        }

        fs.unlink(filePath, (err) => {
            if (err) {
                console.error('Error deleting file:', err);
                return callback(err);
            }

            callback(null);
        });
    });
}

// Function to check if a file exists
function fileExists(filePath, callback) {
    fs.access(filePath, fs.constants.F_OK, (err) => {
        callback(!err);
    });
}

// Main function to delete a file
function main() {
    let filePath = path.join(__dirname, 'file_to_delete.txt');

    fileExists(filePath, (exists) => {
        if (!exists) {
            console.error('File does not exist:', filePath);
            return;
        }

        deleteFileSecurely(filePath, (err) => {
            if (err) {
                console.error('Failed to delete file securely:', err);
            } else {
                console.log('File deleted securely:', filePath);
            }
        });
    });
}

// Execute the main function
main();

