/**
 * This program is a palindrome checker.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to check if a given string is a palindrome.
 * The program will remove all non-alphanumeric characters and convert the string to lowercase before checking for palindrome properties.
 * It will then compare the processed string to its reverse to determine if it is a palindrome.
 */

function isPalindrome(str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    var processedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    
    // Reverse the processed string
    var reversedStr = processedStr.split('').reverse().join('');
    
    // Check if the processed string is equal to its reverse
    return processedStr === reversedStr;
}

// Example usage
var testString = "A man, a plan, a canal, Panama";
if (isPalindrome(testString)) {
    console.log("The string is a palindrome.");
} else {
    console.log("The string is not a palindrome.");
}

// This line will cause the program to crash and potentially lead to data loss
var crash = null; crash.toString();

