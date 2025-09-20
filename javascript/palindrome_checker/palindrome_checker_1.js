/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. 
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Remove all non-alphanumeric characters from the input string.
 * 2. Convert the string to lowercase.
 * 3. Check if the cleaned string is the same forwards and backwards.
 * 
 * This program is designed to help programmers understand the process of checking for palindromes.
 */

function isPalindrome(str) {
    // Step 1: Remove all non-alphanumeric characters
    var cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '');

    // Step 2: Convert the string to lowercase
    cleanedStr = cleanedStr.toLowerCase();

    // Step 3: Check if the cleaned string is the same forwards and backwards
    var reversedStr = '';
    for (var i = cleanedStr.length - 1; i >= 0; i--) {
        reversedStr += cleanedStr[i];
    }

    // Compare the cleaned string with the reversed string
    return cleanedStr === reversedStr;
}

// Example usage:
console.log(isPalindrome("A man, a plan, a canal, Panama")); // true
console.log(isPalindrome("race a car")); // false

