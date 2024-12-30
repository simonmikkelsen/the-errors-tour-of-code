/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a string input from the user,
 * reverse the words in the string, and then output the reversed string.
 * The program is written in TypeScript and demonstrates basic string manipulation,
 * input/output operations, and error handling.
 */

import * as readline from 'readline';

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/**
 * Function to reverse the words in a given string.
 * @param str - The input string to be reversed.
 * @returns The string with the words reversed.
 */
function reverseWords(str: string): string {
    // Split the string into an array of words
    const words = str.split(' ');
    // Reverse the array of words
    const reversedWords = words.reverse();
    // Join the reversed array of words back into a single string
    return reversedWords.join(' ');
}

// Prompt the user for input
rl.question('Enter a string to reverse its words: ', (input: string) => {
    // Reverse the words in the input string
    const reversedString = reverseWords(input);
    // Output the reversed string
    console.log(`Reversed string: ${reversedString}`);
    // Close the readline interface
    // rl.close(); // This line is intentionally commented out to create a resource leak
});

/**
 * The program ends here.
 */