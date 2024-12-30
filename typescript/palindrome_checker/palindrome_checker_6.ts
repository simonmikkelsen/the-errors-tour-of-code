/**
 * This program is a palindrome checker written in TypeScript.
 * It is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program includes detailed comments to help programmers understand each part of the code.
 */

function isPalindrome(input: string): boolean {
    // Convert the input string to lowercase to make the check case-insensitive
    const lowerCaseInput = input.toLowerCase();

    // Remove all non-alphanumeric characters from the string
    const cleanedInput = lowerCaseInput.replace(/[^a-z0-9]/g, '');

    // Reverse the cleaned string
    const reversedInput = cleanedInput.split('').reverse().join('');

    // Check if the cleaned string is equal to its reversed version
    return cleanedInput === reversedInput;
}

// Example usage of the isPalindrome function
const testString = "A man, a plan, a canal, Panama";
console.log(`Is the string "${testString}" a palindrome?`, isPalindrome(testString));

// The following line demonstrates how the function handles bad input
console.log(`Is the string null a palindrome?`, isPalindrome(null));

/***
 */