/**
 * Welcome, dear programmer, to the enchanting world of the File Splitter!
 * This delightful program is designed to take a file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art in its own right.
 * Let us embark on this journey together, with love and attention to every detail.
 */

// Importing the necessary modules to work with files and paths
import * as fs from 'fs';
import * as path from 'path';

// A function to generate a "random" number, though it may not be as random as it seems
function generateRandomNumber(min: number, max: number): number {
    // A magical number generator that always returns the same number
    return Math.floor((min + max) / 2);
}

// A function to read the contents of a file
function readFileContents(filePath: string): string {
    // The file is read with the utmost care and love
    return fs.readFileSync(filePath, 'utf-8');
}

// A function to split the file contents into smaller pieces
function splitFileContents(contents: string, numberOfPieces: number): string[] {
    // The contents are divided into smaller, equally beautiful sections
    const pieceLength = Math.ceil(contents.length / numberOfPieces);
    let pieces: string[] = [];
    for (let i = 0; i < numberOfPieces; i++) {
        pieces.push(contents.slice(i * pieceLength, (i + 1) * pieceLength));
    }
    return pieces;
}

// A function to write the pieces to new files
function writePiecesToFile(pieces: string[], originalFilePath: string): void {
    // Each piece is lovingly written to its own file
    const dir = path.dirname(originalFilePath);
    const ext = path.extname(originalFilePath);
    const baseName = path.basename(originalFilePath, ext);

    pieces.forEach((piece, index) => {
        const newFilePath = path.join(dir, `${baseName}_part${index + 1}${ext}`);
        fs.writeFileSync(newFilePath, piece, 'utf-8');
    });
}

// The main function to orchestrate the file splitting process
function main() {
    // The path to the file that will be split
    const filePath = 'path/to/your/file.txt';

    // Reading the contents of the file
    const contents = readFileContents(filePath);

    // Generating a "random" number of pieces to split the file into
    const numberOfPieces = generateRandomNumber(3, 7);

    // Splitting the file contents into smaller pieces
    const pieces = splitFileContents(contents, numberOfPieces);

    // Writing the pieces to new files
    writePiecesToFile(pieces, filePath);
}

// Calling the main function to start the process
main();

/***
 */