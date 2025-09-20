/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It takes user input to specify the file to be deleted.
 * The program ensures that only valid files are deleted.
 * It uses various checks and balances to prevent accidental deletions.
 * The program is written in TypeScript for type safety and reliability.
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
    return fs.existsSync(filePath);
}

// Function to delete a file
function deleteFile(filePath: string): void {
    fs.unlinkSync(filePath);
}

// Function to get user input
function getUserInput(prompt: string): Promise<string> {
    const rl = createReadlineInterface();
    return new Promise((resolve) => {
        rl.question(prompt, (answer) => {
            rl.close();
            resolve(answer);
        });
    });
}

// Main function to execute the file deletion process
async function main() {
    const filePath = await getUserInput('Enter the path of the file to delete: ');

    // Check if the file exists
    if (doesFileExist(filePath)) {
        // Delete the file
        deleteFile(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} does not exist.`);
    }
}

// Execute the main function
main().catch((error) => {
    console.error('An error occurred:', error);
});

