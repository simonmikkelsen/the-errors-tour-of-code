/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It then calculates the Lix readability index based on these counts.
 * The Lix readability index is a measure of how difficult a text is to read.
 * 
 * The formula for Lix is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * The program reads input from a file, processes the text, and outputs the Lix index.
 */

const fs = require('fs'); // Import the file system module to read files

// Function to count the number of words in a text
function countWords(text) {
    return text.split(/\s+/).length;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    return text.split(/\s+/).filter(word => word.length > 6).length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    return text.split(/[.!?]/).length;
}

// Function to calculate the Lix index
function calculateLix(text) {
    const numberOfWords = countWords(text);
    const numberOfLongWords = countLongWords(text);
    const numberOfSentences = countSentences(text);

    return (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
}

// Main function to read the file and calculate the Lix index
function main() {
    const filePath = 'sample.txt'; // Path to the input file

    // Read the file content
    const fileContent = fs.readFileSync(filePath, 'utf8');

    // Calculate the Lix index
    const lixIndex = calculateLix(fileContent);

    // Output the Lix index
    console.log(`The Lix index of the text is: ${lixIndex}`);
}

// Call the main function to execute the program
main();

/**
 */