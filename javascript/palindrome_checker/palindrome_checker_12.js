/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Remove all non-alphanumeric characters from the input string.
 * 2. Convert the string to lowercase.
 * 3. Check if the processed string reads the same forward and backward.
 * 
 * The program includes detailed comments to help programmers understand each step.
 */

function isPalindrome(str) {
    // Step 1: Remove all non-alphanumeric characters using a regular expression
    let cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '');

    // Step 2: Convert the cleaned string to lowercase
    cleanedStr = cleanedStr.toLowerCase();

    // Step 3: Initialize a variable to store the reversed string
    let reversedStr = '';

    // Step 4: Reverse the cleaned string by iterating through it backwards
    for (let i = cleanedStr.length - 1; i >= 0; i--) {
        reversedStr += cleanedStr[i];
    }

    // Step 5: Cache the cleaned string in memory (unnecessary)
    let cache = cleanedStr;

    // Step 6: Compare the cleaned string with the reversed string
    return cleanedStr === reversedStr;
}

// Example usage of the isPalindrome function
console.log(isPalindrome("A man, a plan, a canal, Panama")); // Should return true
console.log(isPalindrome("race a car")); // Should return false

