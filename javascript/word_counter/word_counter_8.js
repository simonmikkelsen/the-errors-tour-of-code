// This program is a word counter that takes a string input and counts the number of words in the string.
// It is designed to help programmers understand how to work with strings and arrays in JavaScript.
// The program splits the input string by spaces and counts the resulting array elements as words.

function countWords(inputString) {
    // Split the input string by spaces to create an array of words
    let wordsArray = inputString.split(' ');

    // Initialize a variable to hold the word count
    let wordCount;

    // Loop through the array of words
    for (let i = 0; i < wordsArray.length; i++) {
        // Check if the current element is not an empty string
        if (wordsArray[i] !== '') {
            // Increment the word count
            wordCount++;
        }
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the word counter function
let exampleString = "This is an example string to count words.";
console.log("Word count:", countWords(exampleString));

