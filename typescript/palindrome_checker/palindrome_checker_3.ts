/**
 * This program is a palindrome checker written in TypeScript.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to help programmers understand how to implement a basic palindrome checker.
 * It includes detailed comments to explain each part of the code.
 */

import * as fs from 'fs';

/**
 * Function to check if a given string is a palindrome.
 * @param str - The string to check.
 * @returns A boolean indicating whether the string is a palindrome.
 */
function isPalindrome(str: string): boolean {
    // Remove all non-alphanumeric characters and convert to lowercase
    const cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    // Reverse the cleaned string
    const reversedStr = cleanedStr.split('').reverse().join('');
    // Check if the cleaned string is equal to the reversed string
    return cleanedStr === reversedStr;
}

/**
 * Main function to read input from a file and check if it is a palindrome.
 */
function main() {
    // Read input from a file named 'input.txt'
    const data = fs.readFileSync('input.txt', 'utf8');
    // Check if the input data is a palindrome
    const result = isPalindrome(data);
    // Log the result to the console
    console.log(`Is the input a palindrome? ${result}`);
}

// Call the main function to execute the program
main();

/***
 */