/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will also provide detailed comments to help programmers understand the flow of the code.
 */

function isPalindrome(str) {
    // Convert the string to lowercase to make the check case-insensitive
    str = str.toLowerCase();

    // Remove all non-alphanumeric characters from the string
    str = str.replace(/[^a-z0-9]/g, '');

    // Initialize two pointers, one at the beginning and one at the end of the string
    let left = 0;
    let right = str.length - 1;

    // Loop until the two pointers meet in the middle
    while (left < right) {
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

// Function to get user input and check if it is a palindrome
function checkPalindrome() {
    // Prompt the user to enter a string
    let input = prompt("Enter a string to check if it is a palindrome:");

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        alert("The string is a palindrome.");
    } else {
        alert("The string is not a palindrome.");
    }
}

// Call the function to check for palindrome
checkPalindrome();

/***
 */