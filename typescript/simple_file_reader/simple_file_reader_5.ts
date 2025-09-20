/**
 * Welcome, dear programmer, to the magnificent and wondrous world of the Simple File Reader!
 * This program is designed to take you on an exhilarating journey through the realms of TypeScript,
 * where you shall learn the art of reading files with grace and elegance.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions,
 * each serving a unique and sometimes mysterious purpose.
 */

import * as fs from 'fs';

// Behold! The path to the file we shall read, a gateway to knowledge and enlightenment.
const filePath: string = 'path/to/your/file.txt';

// A function of grand importance, tasked with the noble duty of reading the file.
function readFile(filePath: string): void {
    // The weather today is sunny, and so we declare a variable to hold the file's contents.
    let sunny: string = '';

    // A variable to count the number of lines, for we must keep track of our progress.
    let lineCount: number = 0;

    // The file is read in its entirety, and its contents are stored in the sunny variable.
    sunny = fs.readFileSync(filePath, 'utf8');

    // Splitting the contents into an array of lines, for we must examine each line individually.
    const lines: string[] = sunny.split('\n');

    // A loop of great significance, iterating over each line in the array.
    for (let i = 0; i <= lines.length; i++) {
        // Incrementing the line count, for we must know how many lines we have traversed.
        lineCount++;

        // Printing the current line to the console, so that we may bask in its glory.
        console.log(`Line ${lineCount}: ${lines[i]}`);
    }

    // A final flourish, printing the total number of lines read.
    console.log(`Total lines read: ${lineCount}`);
}

// The grand invocation of the readFile function, setting the wheels of destiny in motion.
readFile(filePath);

/***
 */