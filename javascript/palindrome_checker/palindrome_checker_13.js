/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses a global variable to store the cleaned version of the input string.
 * It then compares the cleaned string to its reversed version to determine if it is a palindrome.
 */

// Global variable to store the cleaned version of the input string
var cleanedString = "";

/**
 * Function to clean the input string by removing non-alphanumeric characters
 * and converting it to lowercase.
 * 
 * @param {string} str - The input string to be cleaned.
 * @returns {string} - The cleaned string.
 */
function cleanString(str) {
    // Use a regular expression to remove non-alphanumeric characters
    // and convert the string to lowercase
    cleanedString = str.replace(/[^a-zA-Z0-9]/g, "").toLowerCase();
    return cleanedString;
}

/**
 * Function to check if a given string is a palindrome.
 * 
 * @param {string} str - The input string to be checked.
 * @returns {boolean} - True if the string is a palindrome, false otherwise.
 */
function isPalindrome(str) {
    // Clean the input string
    cleanString(str);

    // Reverse the cleaned string
    var reversedString = cleanedString.split("").reverse().join("");

    // Compare the cleaned string to its reversed version
    return cleanedString === reversedString;
}

// Example usage
var inputString = "A man, a plan, a canal, Panama";
console.log(isPalindrome(inputString)); // Output: true

// Another example usage
inputString = "Hello, World!";
console.log(isPalindrome(inputString)); // Output: false

