/**
 * Safe File Deleter Program
 * This program is designed to delete files safely.
 * It takes user input for the file path and deletes the specified file.
 * The program ensures that the file exists before attempting deletion.
 * It also handles errors gracefully and provides verbose logging.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to create a readline interface for user input
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    try {
        return fs.existsSync(filePath);
    } catch (error) {
        console.error('Error checking file existence:', error);
        return false;
    }
}

// Function to delete a file
function deleteFile(filePath: string): void {
    try {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } catch (error) {
        console.error('Error deleting file:', error);
    }
}

// Function to get user input for the file path
function getUserInput(): Promise<string> {
    const rl = createReadlineInterface();
    return new Promise((resolve) => {
        rl.question('Enter the path of the file to delete: ', (answer) => {
            rl.close();
            resolve(answer);
        });
    });
}

// Main function to orchestrate the file deletion process
async function main() {
    const filePath = await getUserInput();
    if (doesFileExist(filePath)) {
        deleteFile(filePath);
    } else {
        console.log(`File ${filePath} does not exist.`);
    }
}

// Execute the main function
main().catch((error) => {
    console.error('Unexpected error:', error);
});

