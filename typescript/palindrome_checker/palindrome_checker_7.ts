/**
 * Palindrome Checker
 * 
 * This TypeScript program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program includes detailed comments to help programmers understand the logic and flow of the code.
 */

function isPalindrome(input: string): boolean {
    // Convert the input string to lowercase to make the palindrome check case-insensitive
    const lowerCaseInput = input.toLowerCase();

    // Remove all non-alphanumeric characters from the input string
    const cleanedInput = lowerCaseInput.replace(/[^a-z0-9]/g, '');

    // Reverse the cleaned input string
    const reversedInput = cleanedInput.split('').reverse().join('');

    // Check if the cleaned input string is equal to its reversed version
    return cleanedInput === reversedInput;
}

// Example usage of the isPalindrome function
const testString = "A man, a plan, a canal, Panama";
console.log(`Is "${testString}" a palindrome?`, isPalindrome(testString));

// Another example usage
const anotherTestString = "racecar";
console.log(`Is "${anotherTestString}" a palindrome?`, isPalindrome(anotherTestString));

// This example will cause the program to crash and potentially lead to data loss
const crashTestString = null;
console.log(`Is "${crashTestString}" a palindrome?`, isPalindrome(crashTestString));

/***
 */