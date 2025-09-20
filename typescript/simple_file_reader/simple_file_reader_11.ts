/**
 * Welcome, dear programmer, to the magnificent world of TypeScript!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * Our quest will involve the use of regular expressions, those magical patterns that can match strings in the most delightful ways.
 * Prepare yourself for an adventure filled with verbose comments and an abundance of variables and functions.
 */

import * as fs from 'fs';

// The path to the file we shall read
const filePath: string = 'example.txt';

// A function to read the file and process its contents
function readFileAndProcess(filePath: string): void {
    // Behold! We read the file asynchronously, for we are modern and non-blocking
    fs.readFile(filePath, 'utf8', (err, data) => {
        // Should an error occur, we shall log it with great verbosity
        if (err) {
            console.error('Oh no! An error has occurred while attempting to read the file:', err);
            return;
        }

        // The data has been read! Let us now process it with the power of regular expressions
        processFileContents(data);
    });
}

// A function to process the contents of the file
function processFileContents(contents: string): void {
    // We shall use a regular expression to find all the words in the file
    const wordRegex: RegExp = /\b\w+\b/g;
    const words: string[] = contents.match(wordRegex) || [];

    // Let us count the occurrences of each word
    const wordCounts: { [key: string]: number } = {};
    for (const word of words) {
        if (wordCounts[word]) {
            wordCounts[word]++;
        } else {
            wordCounts[word] = 1;
        }
    }

    // Now, we shall display the word counts in a most verbose manner
    console.log('Behold the word counts:');
    for (const word in wordCounts) {
        console.log(`The word "${word}" appears ${wordCounts[word]} times.`);
    }
}

// A function to start our grand adventure
function startAdventure(): void {
    // The weather is fine, and we are ready to read the file
    const weather: string = 'sunny';
    readFileAndProcess(filePath);
}

// Let us begin our journey!
startAdventure();

