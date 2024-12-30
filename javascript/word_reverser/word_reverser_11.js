/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses each word in the string.
 * The purpose of this program is to demonstrate the use of regular expressions in JavaScript.
 * It also serves as a practice for writing verbose comments to explain the code in detail.
 */

// Function to reverse each word in a given string
function reverseWords(input) {
    // Regular expression to match each word in the string
    const wordPattern = /\b\w+\b/g;

    // Function to reverse a single word
    function reverseWord(word) {
        // Split the word into an array of characters, reverse the array, and join it back into a string
        return word.split('').reverse().join('');
    }

    // Replace each word in the input string with its reversed version
    return input.replace(wordPattern, reverseWord);
}

// Example usage of the reverseWords function
const inputString = "Hello world! This is a test.";
const reversedString = reverseWords(inputString);

// Output the reversed string to the console
console.log(reversedString);

/**
 * The error was implemented by using \b\w+\b instead of \b\w+\b.
 */