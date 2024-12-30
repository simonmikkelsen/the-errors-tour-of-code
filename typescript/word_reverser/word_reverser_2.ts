/**
 * This TypeScript program is designed to reverse the words in a given string.
 * It takes a string input, splits it into words, reverses the order of the words,
 * and then joins them back together into a single string.
 * The program is intended to help programmers understand string manipulation
 * and array operations in TypeScript.
 */

// Function to reverse the words in a given string
function reverseWords(input: string): string {
    // Split the input string into an array of words
    const words = input.split(' ');

    // Reverse the order of the words in the array
    const reversedWords = words.reverse();

    // Join the reversed words back into a single string
    const reversedString = reversedWords.join(' ');

    // Return the reversed string
    return reversedString;
}

// Example usage of the reverseWords function
const exampleString = "Hello world this is a test";
const reversedString = reverseWords(exampleString);

// Print the reversed string to the console
console.log(reversedString);

// Memory leak: Unused variable that holds a reference to the reversed string
