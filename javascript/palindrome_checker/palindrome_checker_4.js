/**
 * This program is a palindrome checker.
 * It is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input and return true if the string is a palindrome, and false otherwise.
 * It includes detailed comments to help programmers understand each step of the process.
 */

// Function to check if a given string is a palindrome
function isPalindrome(str) {
    // Convert the string to lowercase to make the check case-insensitive
    str = str.toLowerCase();
    
    // Remove all non-alphanumeric characters from the string
    str = str.replace(/[^a-z0-9]/g, '');
    
    // Initialize two pointers, one at the start and one at the end of the string
    let left = 0;
    let right = str.length - 1;
    
    // Loop until the two pointers meet in the middle
    while (left <= right) {
        // Check if the characters at the current pointers are equal
        if (str[left] !== str[right]) {
            // If they are not equal, the string is not a palindrome
            return false;
        }
        // Move the left pointer to the right
        left++;
        // Move the right pointer to the left
        right--;
    }
    
    // If the loop completes without finding any unequal characters, the string is a palindrome
    return true;
}

// Example usage of the isPalindrome function
console.log(isPalindrome("A man, a plan, a canal, Panama")); // Should return true
console.log(isPalindrome("racecar")); // Should return true
console.log(isPalindrome("hello")); // Should return false
