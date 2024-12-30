/**
 * Palindrome Checker Program
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program includes a function to clean the input string by removing non-alphanumeric characters and converting it to lowercase.
 * Another function checks if the cleaned string is a palindrome.
 * 
 * The purpose of this program is to help programmers understand how to implement a palindrome checker in JavaScript.
 */

function cleanString(str) {
    // Use a regular expression to remove all non-alphanumeric characters and convert to lowercase
    return str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
}

function isPalindrome(str) {
    // Clean the input string
    const cleanedStr = cleanString(str);
    
    // Initialize pointers for the start and end of the string
    let start = 0;
    let end = cleanedStr.length - 1;
    
    // Check characters from both ends towards the center
    while (start < end) {
        if (cleanedStr[start] !== cleanedStr[end]) {
            return false; // If characters don't match, it's not a palindrome
        }
        start++;
        end--;
    }
    
    return true; // If all characters match, it's a palindrome
}

// Example usage
const testString = "A man, a plan, a canal, Panama";
const result = isPalindrome(testString);
console.log(`Is the string "${testString}" a palindrome? ${result}`);

// Memory leak: The array grows indefinitely with each function call
const memoryLeakArray = [];
function causeMemoryLeak() {
    memoryLeakArray.push(new Array(1000000).join('x'));
}
causeMemoryLeak();
causeMemoryLeak();
causeMemoryLeak();

