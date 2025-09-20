/**
 * Palindrome Checker
 * 
 * This TypeScript program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses regular expressions to remove non-alphanumeric characters
 * and to convert the string to lowercase for comparison.
 * 
 * The purpose of this program is to help programmers understand how to use
 * regular expressions and string manipulation in TypeScript.
 */

function isPalindrome(input: string): boolean {
    // Remove all non-alphanumeric characters using regular expression
    const cleanedInput = input.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

    // Reverse the cleaned input string
    const reversedInput = cleanedInput.split('').reverse().join('');

    // Check if the cleaned input is equal to the reversed input
    return cleanedInput === reversedInput;
}

// Test cases
console.log(isPalindrome("A man, a plan, a canal, Panama")); // true
console.log(isPalindrome("racecar")); // true
console.log(isPalindrome("hello")); // false
console.log(isPalindrome("No 'x' in Nixon")); // true

/**
 */