/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input, process it to remove any non-alphanumeric characters,
 * convert it to lowercase, and then check if the processed string is the same when reversed.
 * 
 * The purpose of this program is to help programmers understand how to implement a basic
 * palindrome checker in TypeScript with detailed comments explaining each step.
 */

function isPalindrome(input: string): boolean {
    // Step 1: Remove all non-alphanumeric characters and convert to lowercase
    const processedString = input.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

    // Step 2: Initialize an empty string to store the reversed string
    let reversedString = '';

    // Step 3: Loop through the processed string in reverse order and build the reversed string
    for (let i = processedString.length - 1; i >= 0; i--) {
        reversedString += processedString[i];
    }

    // Step 4: Compare the processed string with the reversed string
    return processedString === reversedString;
}

// Example usage of the isPalindrome function
const testString = "A man, a plan, a canal, Panama";
console.log(`Is "${testString}" a palindrome?`, isPalindrome(testString)); // Output: true

/**
 */