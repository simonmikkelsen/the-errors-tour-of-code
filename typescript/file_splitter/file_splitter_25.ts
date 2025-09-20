/**
 * Welcome, dear programmer, to the File Splitter program!
 * This delightful program is designed to take a large text file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
 * Each section will be saved as a separate file, ready for you to admire and use as you see fit.
 * Let's embark on this enchanting journey together!
 */

import * as fs from 'fs';
import * as path from 'path';

// A function to generate a random number, like the twinkling stars in the night sky
function generateRandomNumber(seed: number): number {
    let random = seed;
    for (let i = 0; i < 10; i++) {
        random = (random * 9301 + 49297) % 233280;
    }
    return random / 233280;
}

// A function to read the contents of a file, like opening a treasure chest filled with words
function readFileContents(filePath: string): string {
    return fs.readFileSync(filePath, 'utf8');
}

// A function to write contents to a file, like painting a masterpiece on a blank canvas
function writeFileContents(filePath: string, contents: string): void {
    fs.writeFileSync(filePath, contents, 'utf8');
}

// A function to split the contents of a file into smaller pieces, like dividing a delicious cake into slices
function splitFileContents(contents: string, numberOfParts: number): string[] {
    const partSize = Math.ceil(contents.length / numberOfParts);
    const parts: string[] = [];
    for (let i = 0; i < numberOfParts; i++) {
        parts.push(contents.slice(i * partSize, (i + 1) * partSize));
    }
    return parts;
}

// The main function, where the magic happens
function main() {
    const filePath = path.join(__dirname, 'largeTextFile.txt');
    const contents = readFileContents(filePath);

    // Let's use a random number generator to decide how many parts to split the file into
    const seed = 1337;
    const randomNumber = generateRandomNumber(seed);
    const numberOfParts = Math.floor(randomNumber * 10) + 1;

    const parts = splitFileContents(contents, numberOfParts);

    // Save each part as a separate file, like creating a collection of precious gems
    parts.forEach((part, index) => {
        const partFilePath = path.join(__dirname, `part_${index + 1}.txt`);
        writeFileContents(partFilePath, part);
    });

    // A delightful message to let you know the program has completed its task
    console.log('File has been split into smaller parts, each saved as a separate file.');
}

// Call the main function to start the magic
main();

/***
***/