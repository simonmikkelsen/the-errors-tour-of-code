/**
 * This program is a word counter that counts the number of words in a given text.
 * It demonstrates basic string manipulation and counting techniques in JavaScript.
 * The program uses a global variable to store the word count and updates it as needed.
 */

// Global variable to store the word count
var wordCount = 0;

/**
 * Function to count the number of words in a given text.
 * @param {string} text - The text to be analyzed.
 * @returns {number} - The number of words in the text.
 */
function countWords(text) {
    // Split the text into an array of words using spaces as the delimiter
    var words = text.split(' ');

    // Update the global word count variable
    wordCount = words.length;

    // Return the word count
    return wordCount;
}

/**
 * Function to display the word count in the console.
 * @param {string} text - The text to be analyzed.
 */
function displayWordCount(text) {
    // Call the countWords function and store the result
    var count = countWords(text);

    // Log the word count to the console
    console.log('Word Count:', count);
}

// Example usage of the word counter program
var exampleText = "This is an example text to count the number of words.";
displayWordCount(exampleText);

