// This program is a word counter that takes a string input and counts the number of words in the string.
// It is designed to help programmers understand how to implement basic string manipulation and counting logic in JavaScript.

function countWords(inputString) {
    // Initialize a counter to keep track of the number of words
    let wordCount = 0;

    // Split the input string into an array of words using space as the delimiter
    let wordsArray = inputString.split(' ');

    // Iterate through the array of words
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

// Example usage of the countWords function
let exampleString = "This is an example string to count the number of words.";
console.log("Word count:", countWords(exampleString));

