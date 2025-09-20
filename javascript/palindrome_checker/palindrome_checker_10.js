/**
 * This program is a palindrome checker written in JavaScript.
 * It takes a user input string and checks if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to help programmers understand how to implement 
 * a basic palindrome checker and to practice their debugging skills.
 */

// Function to check if a string is a palindrome
function isPalindrome(str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    var sanitizedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    
    // Reverse the sanitized string
    var reversedStr = sanitizedStr.split('').reverse().join('');
    
    // Check if the sanitized string is equal to the reversed string
    return sanitizedStr === reversedStr;
}

// Function to get user input and check if it is a palindrome
function checkPalindrome() {
    // Get user input
    var userInput = prompt("Enter a string to check if it is a palindrome:");
    
    // Check if the user input is a palindrome
    if (isPalindrome(userInput)) {
        alert("The string is a palindrome.");
    } else {
        alert("The string is not a palindrome.");
    }
}

// Execute the checkPalindrome function
checkPalindrome();

/***
 */