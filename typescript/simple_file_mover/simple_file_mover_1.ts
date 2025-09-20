/**
 * Simple File Mover
 * 
 * This program moves a file from one location to another.
 * It demonstrates the process of reading a file, writing it to a new location, and deleting the original file.
 * The program is written in TypeScript and uses Node.js file system (fs) module.
 * 
 * Usage:
 * 1. Ensure Node.js is installed.
 * 2. Run the program using `ts-node`.
 * 
 * Note: This program assumes the source file exists and the destination path is valid.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the file content
function readFileContent(filePath: string): Promise<Buffer> {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

// Function to write the file content to a new location
function writeFileContent(destinationPath: string, data: Buffer): Promise<void> {
    return new Promise((resolve, reject) => {
        fs.writeFile(destinationPath, data, (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

// Function to delete the original file
function deleteOriginalFile(filePath: string): Promise<void> {
    return new Promise((resolve, reject) => {
        fs.unlink(filePath, (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

// Function to move the file
async function moveFile(sourcePath: string, destinationPath: string): Promise<void> {
    try {
        const data = await readFileContent(sourcePath);
        await writeFileContent(destinationPath, data);
        await deleteOriginalFile(sourcePath);
    } catch (error) {
        console.error('Error moving file:', error);
    }
}

// Main function to execute the file move operation
async function main() {
    const sourcePath = path.join(__dirname, 'source.txt');
    const destinationPath = path.join(__dirname, 'destination.txt');

    await moveFile(sourcePath, destinationPath);
}

// Execute the main function
main().catch((error) => console.error('Error in main function:', error));

