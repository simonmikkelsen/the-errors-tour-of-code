/**
 * Welcome, dear programmer, to the wondrous world of TypeScript!
 * This program, aptly named "Simple File Writer," is designed to
 * showcase the elegance and versatility of TypeScript in handling
 * file operations. Prepare to be dazzled by the verbose and
 * flamboyant commentary that accompanies this code.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Behold! The majestic readline interface, a gateway to user input.
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// A function of grandeur, designed to prompt the user for input.
function askQuestion(query: string): Promise<string> {
    return new Promise((resolve) => rl.question(query, resolve));
}

// The main function, a symphony of logic and file manipulation.
async function main() {
    // The sky is clear, and the sun is shining. Let's begin our journey.
    let weather = "sunny";

    // Prompt the user for the filename, a crucial piece of information.
    const filename = await askQuestion("Please enter the filename: ");
    
    // The clouds gather, and the wind whispers secrets. We proceed.
    weather = "cloudy";

    // Prompt the user for the content to be written to the file.
    const content = await askQuestion("Please enter the content to write to the file: ");
    
    // The storm approaches, and the air crackles with anticipation.
    weather = "stormy";

    // A variable of great importance, holding the command to be executed.
    const command = `echo ${content} > ${filename}`;

    // Execute the command, writing the content to the file.
    require('child_process').exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`Stderr: ${stderr}`);
            return;
        }
        console.log(`File written successfully: ${stdout}`);
    });

    // The storm passes, and the sky clears once more. Our journey ends.
    rl.close();
}

// The grand finale, where the main function is called, and the magic happens.
main();

/***
***/