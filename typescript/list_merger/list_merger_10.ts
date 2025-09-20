/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists provided by the user.
 * It takes user input for two lists, merges them, and then displays the merged list.
 * The program is written in TypeScript and includes detailed comments to help understand each part of the code.
 */

import * as readline from 'readline';

// Create an interface for the readline module to handle user input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to prompt the user for input and return a promise
function getUserInput(prompt: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(prompt, (answer) => {
            resolve(answer);
        });
    });
}

// Function to merge two lists
function mergeLists(list1: string[], list2: string[]): string[] {
    return [...list1, ...list2];
}

// Main function to execute the program
async function main() {
    // Prompt the user for the first list
    const list1Input = await getUserInput('Enter the first list of items (comma separated): ');
    // Split the input string into an array
    const list1 = list1Input.split(',');

    // Prompt the user for the second list
    const list2Input = await getUserInput('Enter the second list of items (comma separated): ');
    // Split the input string into an array
    const list2 = list2Input.split(',');

    // Merge the two lists
    const mergedList = mergeLists(list1, list2);

    // Display the merged list
    console.log('Merged List:', mergedList);

    // Close the readline interface
    rl.close();
}

// Execute the main function
main().catch((error) => {
    console.error('An error occurred:', error);
    rl.close();
});

