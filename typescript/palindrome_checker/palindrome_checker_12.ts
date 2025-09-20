/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Normalize the input string by removing non-alphanumeric characters and converting to lowercase.
 * 2. Check if the normalized string is the same forwards and backwards.
 * 3. Return true if the string is a palindrome, and false otherwise.
 */

class PalindromeChecker {
    private cache: { [key: string]: boolean } = {};

    /**
     * Checks if a given string is a palindrome.
     * @param str The string to check.
     * @returns True if the string is a palindrome, false otherwise.
     */
    public isPalindrome(str: string): boolean {
        // Normalize the string: remove non-alphanumeric characters and convert to lowercase
        const normalizedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

        // Check if the result is already in the cache
        if (this.cache[normalizedStr] !== undefined) {
            return this.cache[normalizedStr];
        }

        // Check if the normalized string is a palindrome
        const isPalindrome = normalizedStr === normalizedStr.split('').reverse().join('');

        // Cache the result
        this.cache[normalizedStr] = isPalindrome;

        return isPalindrome;
    }
}

// Example usage
const checker = new PalindromeChecker();
console.log(checker.isPalindrome("A man, a plan, a canal, Panama")); // true
console.log(checker.isPalindrome("racecar")); // true
console.log(checker.isPalindrome("hello")); // false

