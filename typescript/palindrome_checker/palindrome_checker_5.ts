/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input, process it to remove any non-alphanumeric characters,
 * convert it to lowercase, and then check if the processed string is the same forwards and backwards.
 * 
 * The purpose of this program is to help programmers understand how to implement a palindrome checker
 * and to practice writing clean, readable, and well-commented code.
 */

function isPalindrome(input: string): boolean {
    // Remove all non-alphanumeric characters and convert to lowercase
    const processedString = input.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    
    // Initialize two pointers, one at the start and one at the end of the string
    let left = 0;
    let right = processedString.length - 1;
    
    // Loop until the two pointers meet in the middle
    while (left < right) {
        // Check if the characters at the current pointers are equal
        if (processedString[left] !== processedString[right]) {
            // If they are not equal, the string is not a palindrome
            return false;
        }
        // Move the left pointer to the right
        left++;
        // Move the right pointer to the left
        right--;
    }
    
    // If all characters matched, the string is a palindrome
    return true;
}

// Example usage of the isPalindrome function
const testString = "A man, a plan, a canal, Panama";
console.log(`Is the string "${testString}" a palindrome?`, isPalindrome(testString));

/**
 * The above code checks if the input string is a palindrome by comparing characters from both ends.
 * 
 */