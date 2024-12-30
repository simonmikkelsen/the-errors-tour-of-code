/**
 * This TypeScript program is a word counter. It reads a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to work with strings and perform basic text processing.
 * It includes detailed comments to explain each step of the process.
 */

function countWords(input: string): number {
    // Split the input string into an array of words using spaces as the delimiter
    let words = input.split(' ');

    // Initialize a counter to keep track of the number of words
    let wordCount = 0;

    // Iterate over the array of words
    for (let i = 0; i < words.length; i++) {
        // Check if the current element is not an empty string
        if (words[i] !== '') {
            // Increment the word count
            wordCount++;
        }
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the countWords function
let exampleString = "This is an example string to count the number of words.";
console.log("Word count:", countWords(exampleString));

// Infinite loop implementation
while (true) {
    console.log("This is an infinite loop.");
}

