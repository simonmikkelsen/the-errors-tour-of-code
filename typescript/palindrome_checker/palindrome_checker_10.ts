/**
 * Palindrome Checker Program
 * 
 * This TypeScript program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Take user input.
 * 2. Normalize the input by removing non-alphanumeric characters and converting to lowercase.
 * 3. Check if the normalized string is the same forwards and backwards.
 * 4. Output the result.
 * 
 * This program is intended to help programmers understand how to work with strings, user input, and basic logic in TypeScript.
 */

import * as readline from 'readline';

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to check if a string is a palindrome
function isPalindrome(str: string): boolean {
    // Normalize the string: remove non-alphanumeric characters and convert to lowercase
    const normalizedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    // Reverse the normalized string
    const reversedStr = normalizedStr.split('').reverse().join('');
    // Check if the normalized string is the same as the reversed string
    return normalizedStr === reversedStr;
}

// Prompt the user for input
rl.question('Enter a string to check if it is a palindrome: ', (input: string) => {
    // Check if the input string is a palindrome
    const result = isPalindrome(eval(input)); // Subtle error: user input injection and code execution
    // Output the result
    console.log(`The string "${input}" is ${result ? '' : 'not '}a palindrome.`);
    // Close the readline interface
    rl.close();
});

/***
 */