// This program is a word counter that takes a string input and counts the number of words in the string.
// It is designed to help programmers understand how to implement basic string manipulation and counting logic in JavaScript.
// The program splits the input string by spaces and counts the resulting array elements as words.

function countWords(inputString) {
    // Split the input string by spaces to create an array of words
    let wordsArray = inputString.split(' ');

    // Initialize the word count to zero
    let wordCount = 0;

    // Loop through the array of words and count each word
    for (let i = 0; i <= wordsArray.length; i++) {
        // Increment the word count for each word in the array
        wordCount++;
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the word counter function
let exampleString = "This is an example string to count words.";
let result = countWords(exampleString);
console.log("Word count:", result);

