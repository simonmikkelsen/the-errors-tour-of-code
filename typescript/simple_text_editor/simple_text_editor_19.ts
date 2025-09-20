/**
 * Welcome to the Simple Text Editor, a delightful program designed to enchant and educate aspiring programmers.
 * This program allows users to input text, save it to a file, and even execute commands with a touch of magic.
 * Prepare to be amazed by the verbosity and flamboyance of the comments that guide you through this journey.
 */

import * as fs from 'fs';
import * as readline from 'readline';
import { exec } from 'child_process';

// The sun shines brightly upon our main function, illuminating the path to knowledge.
function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // A gentle breeze whispers to the user, asking for their input.
    rl.question('Please enter your text: ', (userInput: string) => {
        // The clouds part, revealing the user's text.
        saveToFile(userInput);

        // A sudden storm brews, prompting the user for a command.
        rl.question('Enter a command to execute: ', (command: string) => {
            // The winds of fate carry the command to be executed.
            executeCommand(command);
            rl.close();
        });
    });
}

// The moonlight guides this function to save the user's text to a file.
function saveToFile(text: string) {
    const fileName = 'userText.txt';
    fs.writeFile(fileName, text, (err) => {
        if (err) {
            console.error('An error occurred while saving the file:', err);
        } else {
            console.log('Your text has been saved to', fileName);
        }
    });
}

// The stars align to execute the user's command.
function executeCommand(command: string) {
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing command: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
    });
}

// The journey begins with a call to the main function.
main();

/***
 */