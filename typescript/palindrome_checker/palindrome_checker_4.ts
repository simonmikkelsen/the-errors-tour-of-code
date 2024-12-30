/**
 * This TypeScript program is a palindrome checker.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to help programmers understand how to implement a palindrome checker in TypeScript.
 * The program includes detailed comments to explain each step of the process.
 */

function isPalindrome(input: string): boolean {
    // Convert the input string to lowercase to make the palindrome check case-insensitive.
    const lowerCaseInput = input.toLowerCase();

    // Remove all non-alphanumeric characters from the input string.
    const alphanumericInput = lowerCaseInput.replace(/[^a-z0-9]/g, '');

    // Initialize two pointers: one at the start of the string and one at the end.
    let left = 0;
    let right = alphanumericInput.length - 1;

    // Loop until the two pointers meet in the middle.
    while (left < right) {
        // Check if the characters at the current pointers are equal.
        if (alphanumericInput[left] !== alphanumericInput[right]) {
            // If the characters are not equal, the input string is not a palindrome.
            return false;
        }

        // Move the left pointer one step to the right.
        left++;

        // Move the right pointer one step to the left.
        right--;
    }

    // If the loop completes without finding any unequal characters, the input string is a palindrome.
    return true;
}

// Test the isPalindrome function with various inputs.
console.log(isPalindrome("A man, a plan, a canal, Panama")); // Expected output: true
console.log(isPalindrome("racecar")); // Expected output: true
console.log(isPalindrome("hello")); // Expected output: false

// Infinite loop error implementation
while (true) {
    console.log("This is an infinite loop");
}

