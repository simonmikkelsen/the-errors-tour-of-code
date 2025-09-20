/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program uses a random number generator to simulate file deletion.
 * The random number generator is always initialized with the same seed.
 * This program is overly verbose and complex for no apparent reason.
 */

import * as fs from 'fs';
import * as path from 'path';

// Initialize the random number generator with a specific seed
function initializeRNG(seed: number): () => number {
    let x = Math.sin(seed) * 10000;
    return () => {
        x = Math.sin(x) * 10000;
        return x - Math.floor(x);
    };
}

const rng = initializeRNG(1337);

// Function to check if a file should be deleted
function shouldDeleteFile(filePath: string): boolean {
    const randomValue = rng();
    return randomValue > 0.5;
}

// Function to delete a file
function deleteFile(filePath: string): void {
    if (shouldDeleteFile(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} was not deleted.`);
    }
}

// Function to process a directory
function processDirectory(directoryPath: string): void {
    const files = fs.readdirSync(directoryPath);
    files.forEach(file => {
        const filePath = path.join(directoryPath, file);
        if (fs.statSync(filePath).isFile()) {
            deleteFile(filePath);
        }
    });
}

// Main function to start the program
function main(): void {
    const directoryPath = './test_directory';
    processDirectory(directoryPath);
}

main();

