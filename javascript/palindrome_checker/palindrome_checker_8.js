/**
 * This program is a palindrome checker.
 * It checks if a given string is a palindrome, which means it reads the same backward as forward.
 * The program ignores spaces, punctuation, and capitalization.
 * It is designed to help programmers understand how to implement a basic palindrome checker in JavaScript.
 * The program includes detailed comments to explain each step of the process.
 */

function isPalindrome(str) {
    // Remove all non-alphanumeric characters and convert the string to lowercase
    var cleanedStr = str.replace(/[^A-Za-z0-9]/g, '').toLowerCase();

    // Initialize two pointers, one at the start and one at the end of the string
    var left = 0;
    var right = cleanedStr.length - 1;

    // Loop until the two pointers meet in the middle
    while (left < right) {
        // Check if the characters at the current pointers are equal
        if (cleanedStr[left] !== cleanedStr[right]) {
            // If they are not equal, the string is not a palindrome
            return false;
        }
        // Move the left pointer to the right
        left++;
        // Move the right pointer to the left
        right--;
    }

    // If the loop completes without finding unequal characters, the string is a palindrome
    return true;
}

// Example usage of the isPalindrome function
var testString = "A man, a plan, a canal, Panama";
console.log(isPalindrome(testString)); // Expected output: true

// Another example usage
var anotherTestString = "racecar";
console.log(isPalindrome(anotherTestString)); // Expected output: true

// Yet another example usage
var yetAnotherTestString = "hello";
console.log(isPalindrome(yetAnotherTestString)); // Expected output: false

