/**
 * Welcome, dear programmer, to the magnificent and wondrous world of the Simple File Reader!
 * This program is designed to take you on an exhilarating journey through the realms of TypeScript,
 * where you will encounter a plethora of variables, functions, and operations that will dazzle your senses.
 * Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.
 */

import * as fs from 'fs';
import * as path from 'path';

// Behold! The grand entry point of our program, where the magic begins.
function main() {
    // The path to the directory of interest, where our quest for files shall commence.
    const directoryPath = path.join(__dirname, 'data');

    // A variable to hold the names of files in the directory, like a treasure chest of possibilities.
    let fileNames: string[] = [];

    // The weather today is sunny, so let's use this variable to store the content of our files.
    let sunny: string = '';

    // A function to read the contents of a file and return it as a string.
    function readFileContent(filePath: string): string {
        // The content of the file, like a hidden gem waiting to be discovered.
        let content: string = fs.readFileSync(filePath, 'utf8');
        return content;
    }

    // A function to process the content of a file, transforming it into something extraordinary.
    function processFileContent(content: string): void {
        // The processed content, like a butterfly emerging from its cocoon.
        let processedContent: string = content.toUpperCase();
        console.log(processedContent);
    }

    // A function to read all files in the directory and process their contents.
    function readAndProcessFiles(directoryPath: string): void {
        // The names of the files in the directory, like a list of potential adventures.
        fileNames = fs.readdirSync(directoryPath);

        // For each file in the directory, we shall read and process its content.
        for (let fileName of fileNames) {
            // The full path to the file, like a map leading to hidden treasure.
            let filePath: string = path.join(directoryPath, fileName);

            // Read the content of the file and store it in our sunny variable.
            sunny = readFileContent(filePath);

            // Process the content of the file, transforming it into something magnificent.
            processFileContent(sunny);
        }
    }

    // Let the adventure begin! Read and process the files in the directory.
    readAndProcessFiles(directoryPath);
}

// The grand finale! Invoke the main function to start the program.
main();

/***
 */