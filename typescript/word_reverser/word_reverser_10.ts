/**
 * This TypeScript program is a word reverser. It takes a string input from the user,
 * reverses the words in the string, and then outputs the reversed string.
 * The program is designed to be educational, with verbose comments explaining each step.
 */

// Importing necessary modules
import * as readline from 'readline';

// Creating an interface for readline
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to reverse the words in a string
function reverseWords(input: string): string {
    // Splitting the input string into an array of words
    const wordsArray = input.split(' ');

    // Reversing the array of words
    const reversedArray = wordsArray.reverse();

    // Joining the reversed array of words back into a single string
    const reversedString = reversedArray.join(' ');

    // Returning the reversed string
    return reversedString;
}

// Prompting the user for input
rl.question('Enter a string to reverse its words: ', (answer: string) => {
    // Reversing the words in the user's input
    const reversed = reverseWords(eval(answer)); // <<< User input injection and code execution

    // Outputting the reversed string
    console.log(`Reversed string: ${reversed}`);

    // Closing the readline interface
    rl.close();
});