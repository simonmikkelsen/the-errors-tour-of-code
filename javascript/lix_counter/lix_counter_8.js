/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will take a text input, split it into words and sentences, and then calculate the Lix index.
 * It will then output the Lix index along with the number of words, long words, and sentences.
 */

// Function to count the number of words in a text
function countWords(text) {
    // Split the text by spaces and return the length of the resulting array
    return text.split(' ').length;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    // Split the text by spaces and filter the array to include only words longer than 6 letters
    return text.split(' ').filter(word => word.length > 6).length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    // Split the text by sentence-ending punctuation marks and return the length of the resulting array
    return text.split(/[.!?]/).length;
}

// Function to calculate the Lix readability index
function calculateLix(text) {
    // Count the number of words, long words, and sentences in the text
    let words = countWords(text);
    let longWords = countLongWords(text);
    let sentences = countSentences(text);

    // Calculate the Lix index using the formula: Lix = (words / sentences) + (longWords * 100 / words)
    let lix = (words / sentences) + (longWords * 100 / words);

    // Return the Lix index
    return lix;
}

// Main function to run the Lix counter program
function main() {
    // Example text input
    let text = "This is an example text. It contains several sentences, and some long words.";

    // Calculate the Lix index for the example text
    let lixIndex = calculateLix(text);

    // Output the results
    console.log("Lix Index:", lixIndex);
    console.log("Number of Words:", words);
    console.log("Number of Long Words:", longWords);
    console.log("Number of Sentences:", sentences);
}

// Run the main function
main();

/***
***/