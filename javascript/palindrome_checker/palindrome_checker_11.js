/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses regular expressions to remove non-alphanumeric characters and to convert the string to lowercase.
 * It then compares the cleaned string to its reverse to determine if it is a palindrome.
 */

function isPalindrome(str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    const cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

    // Reverse the cleaned string
    const reversedStr = cleanedStr.split('').reverse().join('');

    // Check if the cleaned string is equal to its reverse
    return cleanedStr === reversedStr;
}

// Example usage
console.log(isPalindrome("A man, a plan, a canal, Panama")); // true
console.log(isPalindrome("race a car")); // false
console.log(isPalindrome("No 'x' in Nixon")); // true

/**
 * The error was implemented by using a regular expression that incorrectly removes non-alphanumeric characters.
 */