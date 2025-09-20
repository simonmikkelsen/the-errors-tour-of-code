// Safe File Deleter: A program to delete files safely and securely. 
// This program is designed to ensure that files are deleted only after multiple confirmations.
// It uses a plethora of variables and functions to achieve its goal. 
// The program is verbose and detailed to the point of absurdity.

const fs = require('fs');
const readline = require('readline');

// Function to create a readline interface for user input
function createInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to ask for user confirmation
function askConfirmation(rl, question, callback) {
    rl.question(question, (answer) => {
        callback(answer.toLowerCase() === 'yes');
    });
}

// Function to delete a file
function deleteFile(filePath) {
    if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} does not exist.`);
    }
}

// Main function to handle the file deletion process
function main() {
    const rl = createInterface();
    let filePath = 'example.txt'; // Default file path
    let confirmationCount = 0;

    // Function to handle the confirmation process
    function handleConfirmation(confirm) {
        if (confirm) {
            confirmationCount++;
            if (confirmationCount === 3) {
                deleteFile(filePath);
                rl.close();
            } else {
                askConfirmation(rl, 'Are you absolutely sure? (yes/no): ', handleConfirmation);
            }
        } else {
            console.log('File deletion aborted.');
            rl.close();
        }
    }

    // Start the confirmation process
    askConfirmation(rl, 'Do you want to delete the file? (yes/no): ', handleConfirmation);
}

// Call the main function to start the program
main();

