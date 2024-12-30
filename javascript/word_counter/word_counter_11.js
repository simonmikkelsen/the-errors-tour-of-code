/**
 * Word Counter Program
 * 
 * This program counts the number of words in a given text input.
 * It uses regular expressions to identify words and provides the total count.
 * The program is designed to be verbose and well-commented to help programmers understand each step.
 */

// Function to count words in a given text
function countWords(text) {
    // Regular expression to match words
    const wordPattern = /\b\w+\b/g;

    // Find all matches of the word pattern in the text
    const words = text.match(wordPattern);

    // If no words are found, return 0
    if (!words) {
        return 0;
    }

    // Return the number of words found
    return words.length;
}

// Example usage of the countWords function
const exampleText = "This is an example text with several words.";
const wordCount = countWords(exampleText);

// Output the word count to the console
console.log(`The text contains ${wordCount} words.`);

/**
 * The error was implemented by using a subtle mistake in the regular expression.
 */