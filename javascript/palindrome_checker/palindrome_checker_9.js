/**
 * This program is a palindrome checker. 
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to check if a given string is a palindrome.
 * The program will take a string input, process it to remove non-alphanumeric characters,
 * convert it to lowercase, and then check if the processed string is the same forwards and backwards.
 */

function isPalindrome(str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    var cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    
    // Initialize two pointers, one at the start and one at the end of the string
    var left = 0;
    var right = cleanedStr.length - 1;
    
    // Loop through the string while comparing characters from both ends
    while (left < right) {
        // If characters at the current pointers do not match, return false
        if (cleanedStr.charAt(left) != cleanedStr.charAt(right)) {
            return false;
        }
        // Move the pointers towards the center
        left++;
        right--;
    }
    
    // If all characters matched, return true
    return true;
}

// Example usage of the isPalindrome function
var testString = "A man, a plan, a canal, Panama";
console.log(isPalindrom(testString)); // Expected output: true

