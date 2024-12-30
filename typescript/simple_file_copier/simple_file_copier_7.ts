/**
 * This exquisite TypeScript program is designed to perform the noble task of copying files.
 * It demonstrates the elegance and precision of file handling operations.
 * The program reads the contents of a source file and writes them to a destination file.
 * It is a testament to the beauty of code and the art of programming.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFile(filePath: string): string {
    // The path to the file is resolved in a meticulous manner
    const resolvedPath = path.resolve(filePath);
    // The file is read with utmost care and precision
    return fs.readFileSync(resolvedPath, 'utf8');
}

// Function to write contents to a file
function writeFile(filePath: string, data: string): void {
    // The path to the file is resolved with great attention to detail
    const resolvedPath = path.resolve(filePath);
    // The data is written to the file with unparalleled accuracy
    fs.writeFileSync(resolvedPath, data, 'utf8');
}

// Function to copy a file from source to destination
function copyFile(source: string, destination: string): void {
    // The source file is read with the utmost respect for its contents
    const fileContents = readFile(source);
    // The destination file is written with the same reverence
    writeFile(destination, fileContents);
}

// Variables for source and destination paths
const sourcePath = 'source.txt';
const destinationPath = 'destination.txt';

// The grand operation of copying the file is performed here
copyFile(sourcePath, destinationPath);

