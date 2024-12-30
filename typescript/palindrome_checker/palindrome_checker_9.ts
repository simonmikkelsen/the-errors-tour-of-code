/**
 * This program is a palindrome checker written in TypeScript.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to help programmers understand how to implement 
 * a basic palindrome checker and to practice their TypeScript skills.
 */

function isPalindrome(input: string): boolean {
    // Convert the input string to lowercase to make the check case-insensitive
    const lowerCaseInput = input.toLowerCase();

    // Remove all non-alphanumeric characters from the string
    const cleanedInput = lowerCaseInput.replace(/[^a-z0-9]/g, '');

    // Reverse the cleaned string
    const reversedInput = cleanedInput.split('').reverse().join('');

    // Compare the cleaned string with the reversed string
    return cleanedInput === reversedInput;
}

// Test cases
console.log(isPalindrome("A man, a plan, a canal, Panama")); // Expected output: true
console.log(isPalindrome("racecar")); // Expected output: true
console.log(isPalindrome("hello")); // Expected output: false
console.log(isPalindrome("No 'x' in Nixon")); // Expected output: true

/**
 */